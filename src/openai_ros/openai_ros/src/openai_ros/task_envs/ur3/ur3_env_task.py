#!/usr/bin/env python

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
        
        '''
        ROSLauncher(rospackage_name="my_ur3_description",
                    launch_file_name="ur3.launch",
                    ros_ws_abspath=ros_ws_abspath)
        '''

        # Load Params from the desired Yaml file
        LoadYamlFileParamsTest(rospackage_name="my_ur3_description",
                               rel_path_from_package_to_file="config/",
                               yaml_file_name="ur3_position_task.yaml")

        self.get_params()

        self.action_space = spaces.Discrete(self.n_actions)

        low = np.array([-np.pi, -np.pi, -np.pi])
        high = np.array([np.pi, np.pi, np.pi])
        self.observation_space = spaces.Box(low, high)

        self.tolerance = 0.2
        self.iteration = 0
        
        
        super(UR3EnvTask, self).__init__(ros_ws_abspath=ros_ws_abspath)
        self._set_init_pose()
    


    def get_params(self):

        # get configuration parameters
        self.n_actions = rospy.get_param('/ur3/n_actions')
        self.n_observations = rospy.get_param('/ur3/n_observations')
        self.max_iterations = rospy.get_param('/ur3/max_iterations')
        
        self.init_pos = rospy.get_param('/ur3/init_pos')
        self.gloal_pos = rospy.get_param('/ur3/goal_pos')

        self.position_delta = rospy.get_param('/ur3/position_delta')
        self.reached_goal_reward = rospy.get_param('/ur3/reached_goal_reward')

        self.wait_time = rospy.get_param('/ur3/wait_time')
        self.position_delta = rospy.get_param('/ur3/position_delta')
        self.running_time = rospy.get_param('/ur3/running_time')

        self.bounds = [[-1.5, 1.5]]
    
    def initial_position(self):
        self._set_init_pose()
        
        



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
            self.pos["elbow_joint"] = 0.0
            self.pos["shoulder_lift_joint"] = 0.0
            self.pos["shoulder_pan_joint"] = 0.0
            rospy.sleep(self.wait_time) 
            return

        # Apply action to simulation.
        rospy.logdebug("MOVING TO POS=="+str(self.pos))

        # 1st: unpause simulation
        #rospy.logdebug("Unpause SIM...")
        # self.gazebo.unpauseSim()

        self.move_joints(self.pos)
        rospy.logdebug(
            "Wait for some time to execute movement, time="+str(self.running_time))
        rospy.sleep(self.running_time)  # wait for some time
        rospy.logdebug(
            "DONE Wait for some time to execute movement, time=" + str(self.wait_time))

        # 3rd: pause simulation
        #rospy.logdebug("Pause SIM...")
        # self.gazebo.pauseSim()


    #TODO:  this has to be extended to joint readings
    def _get_obs(self):

        data = self.joints[0:3]
        #rospy.logerr(data)
        
        return np.round(np.array(data), 4)



    def _is_done(self, observations):
        done = False

        #data = self.joints

        

        rospy.logdebug("Elbow: "+str(observations[0]))
        rospy.logdebug("Base Lift: " + str(observations[2]))
        rospy.logdebug("Base Pan: " + str(observations[1]))
        # check if the base is still within the ranges of (-2, 2)
        if ((abs(self.gloal_pos["elbow_joint"] - observations[0]) <= self.tolerance) and 
            abs(self.gloal_pos["shoulder_lift_joint"] - observations[1]) <= self.tolerance and 
            abs(self.gloal_pos["shoulder_pan_joint"] - observations[2]) <= self.tolerance):
            '''

        if (self.gloal_pos["elbow_joint"] + 0.2 >= observations[0] >= self.gloal_pos["elbow_joint"] - 0.2) \
            and (self.gloal_pos["shoulder_lift_joint"] + 0.2 >= observations[1] >= self.gloal_pos["shoulder_lift_joint"] - 0.2) \
            and (self.gloal_pos["shoulder_pan_joint"] + 0.2 >= observations[2] >= self.gloal_pos["shoulder_pan_joint"] - 0.2):
            rospy.loginfo("Done achieved")
            '''
            done = True
            self._set_action(10)

        return done

    def _compute_reward(self, observations, done):
        """
        Gives more points for staying upright, gets data from given observations to avoid
        having different data than other previous functions
        :return:reward
        """
        rospy.logdebug("START _compute_reward")

        data = np.array(self.joints[0:3])
        goal = np.array([self.gloal_pos["elbow_joint"], self.gloal_pos["shoulder_lift_joint"], self.gloal_pos["shoulder_pan_joint"]])
        delta = data - goal
        reward = 1/ np.sqrt(np.sum(np.square(delta)))
        if done:
            #change to a value as per assignment
            reward += 500
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
        self.move_joints(self.pos)
        rospy.sleep(3)  # wait for some time
        #rospy.loginfo("moved")

   