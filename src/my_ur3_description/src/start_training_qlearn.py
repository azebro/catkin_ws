#!/usr/bin/env python3


import gym
import time
import numpy
import random
import time
import qlearn
import math
from gym import wrappers
#from gym.envs.registration import register
from openai_ros.openai_ros_common import StartOpenAI_ROS_Environment
import pandas
import functools


# ROS packages required
import rospy
import rospkg

#Binning functions
def build_state(features):
    return int("".join(map(lambda feature: str(int(feature)), features)))

def to_bin(value, bins):
    return numpy.digitize(x=[value], bins=bins)[0]



if __name__ == '__main__':
    
    #Fixing random to reproduce output
    #random.seed(1000000)

    rospy.loginfo ( "Start!")
    rospy.init_node('ur3_gym_learn', anonymous=True, log_level=rospy.INFO)

    # Loads parameters from the ROS param server
    # Parameters are stored in a yaml file inside the config directory
    # They are loaded at runtime by the launch file
    Alpha = rospy.get_param("/ur3/alpha")
    Epsilon = rospy.get_param("/ur3/epsilon")
    Gamma = rospy.get_param("/ur3/gamma")
    epsilon_discount = rospy.get_param("/ur3/epsilon_discount")
    nepisodes = rospy.get_param("/ur3/nepisodes")
    nsteps = rospy.get_param("/ur3/nsteps")
    

    # Create the Gym environment
    env = StartOpenAI_ROS_Environment('ur3-v0')
    #env = gym.make('ur3-v0')
    env._max_episode_steps = nsteps
    rospy.loginfo ( "UR3 environment done")
    rospy.loginfo("Starting Learning")

    # Set the logging system
    rospack = rospkg.RosPack()
    pkg_path = rospack.get_path('my_ur3_description')
    outdir = pkg_path + '/training_results/qlearn'
    #env = wrappers.Monitor(env, outdir, force=True, write_upon_reset=True)
    rospy.loginfo ( "Monitor Wrapper started")
    

    last_time_steps = numpy.ndarray(0)

    '''
    THis is testing of binning approach as a war to restrict the state space
    at the end I have moved in favour of rounding the joint positions, as that
    gave me better results

    n_bins = 2000
    
    #number_of_features = env.observation_space.shape[0]
    number_of_features = 6
    bin_boundary = math.pi /2
    
    shoulder_pan_bins = pandas.cut([-1.4, 1.57], bins=n_bins, retbins=True)[1][1:-1]
    shoulder_lift_bins = pandas.cut([-1, 1], bins=n_bins, retbins=True)[1][1:-1]
    elbow_bins = pandas.cut([-1, 1.50], bins=n_bins, retbins=True)[1][1:-1]
    '''

    # Initialises the qlearn algorithm
    qlearn = qlearn.QLearn(actions=range(env.action_space.n),
                    alpha=Alpha, gamma=Gamma, epsilon=Epsilon)
    initial_epsilon = qlearn.epsilon

    start_time = time.time()
    highest_reward = 0
    rospy.loginfo ( "Q Learn Initated")

    #Loop for the number of episodes
    #Each episode resets the environment
    for x in range(nepisodes):
        rospy.loginfo("EPISODE=>" + str(x))
        #The cumulative reward for the episode
        cumulated_reward = 0
        done = False
        if qlearn.epsilon > 0.05:
            qlearn.epsilon *= epsilon_discount

        # Initialize the environment and get first state of the robot
        observation = env.reset() 
        rospy.loginfo ( "Environment Reset")
        state = '-'.join(map(str, observation))
        

        #Move the robot to 0,0,0 position
        #This is a workaround for reset not bringing arm to the initial pose
        #env.step(10)

        #Loop for n-1 steps, the initial step was to move to 0
        for i in range(nsteps -1):
            exit_flag = False
            rospy.loginfo("############### Start-> Episode: {}, Step: {}".format(x, i))

            # Pick an action based on the current state
            action = qlearn.chooseAction(state)
    
            # Execute the action in the environment and get feedback
            observation, reward, done, info = env.step(action)
            elbow_obs, shoulder_lift_obs, shoulder_pan_obs = observation

            '''
            I have experimented as well here with restricting the arm movements
            for it not to hit the pedestal and table
            This can be enables and the episode will finish if robot tries to move beyind the 'boundary'
            if elbow_obs > 1.3 or elbow_obs < -0.3 or shoulder_lift_obs < -0.4 or shoulder_lift_obs > 0.5 or shoulder_pan_obs < -1 or shoulder_pan_obs > 1.57:
                rospy.loginfo("Boundary hit, Exiting")
                reward = -100
                exit_flag =True
            '''

            '''
            Code to support binning, next state has to be calculated based on bins               

            nextState = build_state([to_bin(elbow_obs, elbow_bins),
                        to_bin(shoulder_lift_obs, shoulder_lift_bins),
                        to_bin(shoulder_pan_obs, shoulder_pan_bins)])
            rospy.loginfo(nextState)
            '''
            


            rospy.logdebug(str(observation) + " " + str(reward))
            cumulated_reward += reward
            if highest_reward < cumulated_reward:
                highest_reward = cumulated_reward

            nextState = '-'.join(map(str, observation))
            rospy.loginfo(nextState)

            # Make the algorithm learn based on the results
            rospy.loginfo("############### state we were->" + str(state))
            rospy.loginfo("############### action that we took->" + str(action))
            rospy.loginfo("############### reward that action gave->" + str(reward))
            rospy.loginfo("############### State in which we will start next step->" + str(nextState))

            #Learn using SARS
            qlearn.learn(state, action, reward, nextState)
            
           
            if not(done):
                state = nextState
                
                if i == nsteps -1:
                    rospy.loginfo("Exiting")
                    break
                
            else:
                rospy.logdebug ("DONE")
                last_time_steps = numpy.append(last_time_steps, [int(i + 1)])
                break
            rospy.logdebug("############### END Step=>" + str(i))
       
        #Required to stop the stats recorder wrapper, otherwise the exception will be raised
        #env.stats_recorder.done = True
       
        m, s = divmod(int(time.time() - start_time), 60)
        h, m = divmod(m, 60)
        rospy.logdebug ( ("EP: "+str(x+1)+" - [alpha: "+str(round(qlearn.alpha,2))+" - gamma: "+str(round(qlearn.gamma,2))+" - epsilon: "+str(round(qlearn.epsilon,2))+"] - Reward: "+str(cumulated_reward)+"     Time: %d:%02d:%02d" % (h, m, s)))


    rospy.loginfo ( ("\n|"+str(nepisodes)+"|"+str(qlearn.alpha)+"|"+str(qlearn.gamma)+"|"+str(initial_epsilon)+"*"+str(epsilon_discount)+"|"+str(highest_reward)+"| PICTURE |"))

    l = last_time_steps.tolist()
    l.sort()

    #print("Parameters: a="+str)
    rospy.loginfo("Overall score: {:0.2f}".format(last_time_steps.mean()))
    rospy.loginfo("Best 100 score: {:0.2f}".format(functools.reduce(lambda x, y: x + y, l[-100:]) / len(l[-100:])))

    env.close()