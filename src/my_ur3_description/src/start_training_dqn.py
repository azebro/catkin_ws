#!/usr/bin/env python3

import rospy
import rospkg
from gym import wrappers
from openai_ros.openai_ros_common import StartOpenAI_ROS_Environment
import gym
from baselines import deepq

rospy.init_node('ur3_training_dqn', anonymous=True, log_level=rospy.WARN)


#DeepQ calback function, will input stats each 100 steps
#And indidate the end of episode
def callback(lcl, _glb):
    # stop training if reward exceeds 199
    if lcl['t'] % 100 == 0: print(lcl['t'], sum(lcl['episode_rewards'][-101:-1]))
    is_solved = lcl['t'] > 100 and sum(lcl['episode_rewards'][-101:-1]) / 100 >= 199
    return is_solved

def main():
    #Start the environment
    env = StartOpenAI_ROS_Environment("ur3-v0")

    # Set the logging system
    rospack = rospkg.RosPack()
    pkg_path = rospack.get_path('my_ur3_description')
    outdir = pkg_path + '/training_results/dqn'
    env = wrappers.Monitor(env, outdir, force=True)
    rospy.loginfo ( "Monitor Wrapper started")
    modelFile = outdir + "/ur3_model.pkl"
    
    #Train the model
    act = deepq.learn(
        env,
        network='mlp',
        lr=1e-4,
        total_timesteps=100000,
        buffer_size=50000,
        exploration_fraction=0.1,
        exploration_final_eps=0.02,
        print_freq=10,
        callback=callback
    )
    print("Saving model to ur3_model.pkl")
    act.save(modelFile)


if __name__ == '__main__':
    main()
