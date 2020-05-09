#!/usr/bin/env python

'''
    Training code made by Ricardo Tellez <rtellez@theconstructsim.com>
    Based on many other examples around Internet
    Visit our website at www.theconstruct.ai
'''
import gym
import time
import numpy
import random
import time
import memory
import dqn2
from gym import wrappers
from gym.envs.registration import register
from openai_ros.openai_ros_common import StartOpenAI_ROS_Environment


# ROS packages required
import rospy
import rospkg




if __name__ == '__main__':

    random.seed(30000000)

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
    outdir = pkg_path + '/training_results'
    env = wrappers.Monitor(env, outdir, force=True)
    rospy.loginfo ( "Monitor Wrapper started")
    

    last_time_steps = numpy.ndarray(0)


    epochs = 1000
    steps = 100000
    updateTargetNetwork = 10000
    explorationRate = 1
    minibatch_size = 384
    learnStart = 128
    learningRate = 0.0025
    discountFactor = 0.99
    memorySize = 1000000

    last100Scores = [0] * 100
    last100ScoresIndex = 0
    last100Filled = False

    

    deepQ = dqn2.DeepQ(3, 6, memorySize, discountFactor, learningRate, learnStart)
    # deepQ.initNetworks([30,30,30])
    # deepQ.initNetworks([30,30])
    deepQ.initNetworks([300, 300, 300])
    stepCounter = 0

    start_time = time.time()
    highest_reward = 0
    rospy.loginfo ( "Q Learn Initated")

    # Starts the main training loop: the one about the episodes to do
    for x in range(nepisodes):
        rospy.loginfo("EPISODE=>" + str(x))

        cumulated_reward = 0
        done = False
       

        # Initialize the environment and get first state of the robot
        
        observation = env.reset()
        
        rospy.loginfo ( "Environment Reset")
        state = ''.join(map(str, observation))

        # Show on screen the actual situation of the robot
        # for each episode, we test the robot for nsteps
        env.step(10)
        for i in range(nsteps -1):
            rospy.loginfo("############### Start Step=>"+str(i))
            # Pick an action based on the current state
            qValues = deepQ.getQValues(observation)

            action = deepQ.selectAction(qValues, explorationRate)

            newObservation, reward, done, info = env.step(action)
            

            deepQ.addMemory(observation, action, reward, newObservation, done)

            if stepCounter >= learnStart:
                if stepCounter <= updateTargetNetwork:
                    deepQ.learnOnMiniBatch(minibatch_size, False)
                else :
                    deepQ.learnOnMiniBatch(minibatch_size, True)

            iobservation = newObservation

            if done:
                last100Scores[last100ScoresIndex] = i
                last100ScoresIndex += 1
                if last100ScoresIndex >= 100:
                    last100Filled = True
                    last100ScoresIndex = 0
                if not last100Filled:
                    print "Episode ",nepisodes," finished after {} timesteps".format(i+1)
                else :
                    print "Episode ",nepisodes," finished after {} timesteps".format(i+1)," last 100 average: ",(sum(last100Scores)/len(last100Scores))
                break
            stepCounter += 1
            if stepCounter % updateTargetNetwork == 0:
                deepQ.updateTargetNetwork()
                print "updating target network"
        env.stats_recorder.done = True
        explorationRate *= 0.995
        # explorationRate -= (2.0/epochs)
        explorationRate = max (0.05, explorationRate)

    rospy.loginfo ( ("\n|"+str(nepisodes)+"|"+str(qlearn.alpha)+"|"+str(qlearn.gamma)+"|"+str(initial_epsilon)+"*"+str(epsilon_discount)+"|"+str(highest_reward)+"| PICTURE |"))

    l = last_time_steps.tolist()
    l.sort()

    #print("Parameters: a="+str)
    rospy.loginfo("Overall score: {:0.2f}".format(last_time_steps.mean()))
    rospy.loginfo("Best 100 score: {:0.2f}".format(reduce(lambda x, y: x + y, l[-100:]) / len(l[-100:])))

    env.close()