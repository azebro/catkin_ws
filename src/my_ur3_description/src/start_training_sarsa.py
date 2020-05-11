#!/usr/bin/env python3


import gym
import time
import numpy
import random
import time
import sarsa
from gym import wrappers
from gym.envs.registration import register
from openai_ros.openai_ros_common import StartOpenAI_ROS_Environment


# ROS packages required
import rospy
import rospkg



if __name__ == '__main__':

    #Fix the randomness
    random.seed(10000000)

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
    running_step = rospy.get_param("/ur3/running_step")

    # Create the Gym environment
    
    env = StartOpenAI_ROS_Environment('ur3-v0')
    env._max_episode_steps = nsteps
    rospy.loginfo ( "UR3 environment done")
    rospy.loginfo("Starting Learning")

    # Set the logging system
    rospack = rospkg.RosPack()
    pkg_path = rospack.get_path('my_ur3_description')
    outdir = pkg_path + '/training_results/sarsa'
    #env = wrappers.Monitor(env, outdir, force=True)
    rospy.loginfo ( "Monitor Wrapper started")
    

    last_time_steps = numpy.ndarray(0)

    

    # Initialises the Sarsa
    qlearn = sarsa.Sarsa(actions=range(env.action_space.n),
                    alpha=Alpha, gamma=Gamma, epsilon=Epsilon)
    initial_epsilon = qlearn.epsilon

    start_time = time.time()
    highest_reward = 0
    rospy.loginfo ( "Sarsa Learn Initated")

    #Loop for the number of episodes
    #Each episode resets the environment
    for x in range(nepisodes):
        rospy.loginfo("EPISODE=>" + str(x))

        #Keep the next action
        action = None
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
        env.step(10)

        #Loop for n-1 steps, the initial step was to move to 0
        for i in range(nsteps -1):
            rospy.loginfo("############### Start Step=>"+str(i))

            # If this is the first run, get the action, otherwise use the action already known
            #from the previous run due to Sarsa needing 'next action'
            if action is None:
                action = qlearn.chooseAction(state)

            rospy.loginfo ("Next action is:%d", action)
            # Execute the action in the environment and get feedback
            observation, reward, done, info = env.step(action)
            rospy.logdebug(str(observation) + " " + str(reward))

            cumulated_reward += reward
            if highest_reward < cumulated_reward:
                highest_reward = cumulated_reward

            nextState = '-'.join(map(str, observation))
            #Get the next action
            action2 = qlearn.chooseAction(nextState)

            # Make the algorithm learn based on the results
            rospy.loginfo("############### state we were=>" + str(state))
            rospy.loginfo("############### action that we took=>" + str(action))
            rospy.loginfo("############### reward that action gave=>" + str(reward))
            rospy.loginfo("############### State in which we will start nect step=>" + str(nextState))

            #Invoke learn based in SARSA
            qlearn.learn(state, action, reward, nextState, action2)
            

            if not(done):
                state = nextState
                action = action2
                if i == nsteps -1:
                    rospy.loginfo("Exiting")
                    break
            else:
                rospy.logdebug ("DONE")
                last_time_steps = numpy.append(last_time_steps, [int(i + 1)])
                break
            rospy.logdebug("############### END Step=>" + str(i))
            
        #Required to stop the stats recorder wrapper, otherwise the exception will be raised
        env.stats_recorder.done = True
        m, s = divmod(int(time.time() - start_time), 60)
        h, m = divmod(m, 60)
        rospy.logdebug ( ("EP: "+str(x+1)+" - [alpha: "+str(round(qlearn.alpha,2))+" - gamma: "+str(round(qlearn.gamma,2))+" - epsilon: "+str(round(qlearn.epsilon,2))+"] - Reward: "+str(cumulated_reward)+"     Time: %d:%02d:%02d" % (h, m, s)))


    rospy.loginfo ( ("\n|"+str(nepisodes)+"|"+str(qlearn.alpha)+"|"+str(qlearn.gamma)+"|"+str(initial_epsilon)+"*"+str(epsilon_discount)+"|"+str(highest_reward)+"| PICTURE |"))

    l = last_time_steps.tolist()
    l.sort()

    rospy.loginfo("Overall score: {:0.2f}".format(last_time_steps.mean()))
    rospy.loginfo("Best 100 score: {:0.2f}".format(reduce(lambda x, y: x + y, l[-100:]) / len(l[-100:])))

    env.close()