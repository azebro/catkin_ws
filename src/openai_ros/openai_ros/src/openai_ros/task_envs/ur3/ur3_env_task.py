#!/usr/bin/env python3

from openai_ros.robot_envs import ur3_env
from gym import utils
from gym.envs.registration import register
from gym import error, spaces
import rospy
import math
import numpy as np
from openai_ros.task_envs.task_commons import LoadYamlFileParamsTest
from openai_ros.openai_ros_common import ROSLauncher
import os


class UR3EnvTask(ur3_env.UR3Env):
    
    def __init__(self):

        ros_ws_abspath = rospy.get_param("/ur3/ros_ws_abspath", None)
        
        assert ros_ws_abspath is not None, "You forgot to set ros_ws_abspath in your yaml file of your main RL script. Set ros_ws_abspath: \'YOUR/SIM_WS/PATH\'"
        assert os.path.exists(ros_ws_abspath), "The Simulation ROS Workspace path " + ros_ws_abspath + \
                                               " DOESNT exist, execute: mkdir -p " + ros_ws_abspath + \
                                               "/src;cd " + ros_ws_abspath + ";catkin_make"
        

        # Load Params from the desired Yaml file
        LoadYamlFileParamsTest(rospackage_name="my_ur3_description",
                               rel_path_from_package_to_file="config/",
                               yaml_file_name="ur3_position_task.yaml")

        self.get_params()

        self.action_space = spaces.Discrete(self.n_actions)

        low = np.array([-np.pi, -np.pi, -np.pi])
        high = np.array([np.pi, np.pi, np.pi])
        self.observation_space = spaces.Box(low, high)

        #self.tolerance = 0.2
        self.iteration = 0
        self.num_envs = 1
        
        super(UR3EnvTask, self).__init__(ros_ws_abspath=ros_ws_abspath)
        self._set_init_pose()
    


    def get_params(self):

        # get configuration parameters
        self.n_actions = rospy.get_param('/ur3/n_actions')
        self.n_observations = rospy.get_param('/ur3/n_observations')
        self.max_iterations = rospy.get_param('/ur3/max_iterations')
        
        self.init_pos = rospy.get_param('/ur3/init_pos')
        self.gloal_pos = rospy.get_param('/ur3/goal_pos')

        self.reached_goal_reward = rospy.get_param('/ur3/reached_goal_reward')

        self.wait_time = rospy.get_param('/ur3/wait_time')
        self.position_delta = rospy.get_param('/ur3/position_delta')
        self.running_time = rospy.get_param('/ur3/running_time')
        self.tolerance = rospy.get_param('/ur3/tolerance')
    
    def initial_position(self):
        self._set_init_pose()
        
        


    '''
    Execute actions:
        0-6: joint movements
        10: move to starting position (0, 0, 0). THis is a workaround for not beging able 
            to reset to initial pose via reset.
    '''
    def _set_action(self, action):

        if action == 0:  # elbow -
            self.pos["elbow_joint"] -= self.position_delta
        elif action == 1:  # elbow +
            self.pos["elbow_joint"] += self.position_delta
        elif action == 2:  # shoulder_lift -
            self.pos["shoulder_lift_joint"] -= self.position_delta
        elif action == 3:  # shoulder_lift -
            self.pos["shoulder_lift_joint"] += self.position_delta
        elif action == 4:  # shoulder_pan -
            self.pos["shoulder_pan_joint"] -= self.position_delta
        elif action == 5:  # shoulder_pan +
            self.pos["shoulder_pan_joint"] += self.position_delta
        elif action == 10:
            #Initial pose selected, move and exit
            self.pos["elbow_joint"] = 0.0
            self.pos["shoulder_lift_joint"] = 0.0
            self.pos["shoulder_pan_joint"] = 0.0
            rospy.sleep(self.wait_time) 
            return
            

        rospy.logdebug("MOVING TO POS=="+str(self.pos))
        self.move_joints(self.pos)

        rospy.logdebug(
            "Wait for some time to execute movement, time="+str(self.running_time))
        #rospy.sleep(self.running_time)  # wait for some time
        rospy.logdebug(
            "DONE Wait for some time to execute movement, time=" + str(self.wait_time))



    '''
    Return observations.
    To reduce state space I will round the position
    Rounding too much results in bobot geting stuck in same movement pattern
    Rounding too little, hinders learning as states are too many
    I found that 3 is the optimal number to balance the state space.
    The only downside is the for DQN it takes ~2000-3000 moves to find first goal
    '''
    def _get_obs(self):

        data = self.joints[0:3]
        return np.round(np.array(data), 3)


    #Am I done?
    def _is_done(self, observations):
        done = False

        rospy.logdebug("Elbow: "+str(observations[0]))
        rospy.logdebug("Base Lift: " + str(observations[2]))
        rospy.logdebug("Base Pan: " + str(observations[1]))

        # Check f the joints are in the position that can be assumed goal:
        # Goal position +- tolerance
        if ((abs(self.gloal_pos["elbow_joint"] - observations[0]) <= self.tolerance) and 
            abs(self.gloal_pos["shoulder_lift_joint"] - observations[1]) <= self.tolerance and 
            abs(self.gloal_pos["shoulder_pan_joint"] - observations[2]) <= self.tolerance):

            #Set the done flag
            done = True
            

        return done

    """
        Compute the reward for arm movement
        The base calculation is The reward at each step is defined as follows:
        r = 1/ sqrt(sum(d**2))
        where d is difference in current and goal position for each joint

    """
    def _compute_reward(self, observations, done):
        
        rospy.logdebug("START _compute_reward")
        #Current joint positions
        data = np.array(self.joints[0:3])
        #The goal positions
        goal = np.array([self.gloal_pos["elbow_joint"], self.gloal_pos["shoulder_lift_joint"], self.gloal_pos["shoulder_pan_joint"]])
        #Calculate difference
        delta = data - goal
        #Perform the formula calculation
        reward = 1/ np.sqrt(np.sum(np.square(delta)))
        #Add bonus reward if arm has reached the goal
        if done:
            #change to a value as per assignment
            reward += self.reached_goal_reward
            rospy.loginfo("Done Reward: {}".format(reward))

        rospy.logdebug("END _compute_reward")

        return reward

    def _init_env_variables(self):
        """
        Inits variables needed to be initialised each time we reset at the start
        of an episode.
        :return:
        """
        self.steps_beyond_done = None

    def _set_init_pose(self):
        """
        Sets joints to initial position [0,0,0]
        :return:
        """
        rospy.loginfo("_set_init_pose called")
        self.check_publishers_connection()

        # Reset Internal pos variable
        self.init_internal_vars(self.init_pos)
        rospy.loginfo(self.pos)
        self.move_joints( self.init_pos)
        #rospy.sleep(3)  # wait for some time
        

   