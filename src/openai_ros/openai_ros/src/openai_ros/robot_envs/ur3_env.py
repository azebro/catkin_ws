"""
Add imports

This should include (among others):
    - message types required by publishers/subscribers
    - relevant openai_ros imports
"""
#!/usr/bin/env python3

import gym
import rospy
import roslaunch
import time
import numpy as np
from gym import utils, spaces
from geometry_msgs.msg import Twist
from std_srvs.srv import Empty
from gym.utils import seeding
from gym.envs.registration import register
import copy
import math
import os

from sensor_msgs.msg import JointState
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from std_msgs.msg import Float64
from gazebo_msgs.srv import SetLinkState
from gazebo_msgs.msg import LinkState
from rosgraph_msgs.msg import Clock
from openai_ros import robot_gazebo_env
from openai_ros.openai_ros_common import ROSLauncher
from openai_ros.task_envs.task_commons import LoadYamlFileParamsTest



class UR3Env(robot_gazebo_env.RobotGazeboEnv):

    def __init__(self, ros_ws_abspath):

        """
        Start ROSlaunch that spawns the robot into the world
        Define ROS publishers, subscribers, controllers list and robot namespace
        Set reset_controls class variable to true
        """
        # Launch the robot
        
        ROSLauncher(rospackage_name="my_ur3_description",
                    launch_file_name="ur3.launch",
                    ros_ws_abspath=ros_ws_abspath)

         # Load Params from the desired Yaml file
        LoadYamlFileParamsTest(rospackage_name="my_ur3_description",
                               rel_path_from_package_to_file="config/",
                               yaml_file_name="ur3_position_task.yaml")
        

        
        #Add the needed joint publishers
        self.publishers_array = {}
        self._shoulder_pan_pub = rospy.Publisher(
            '/ur3/shoulder_pan_joint_position_controller/command', Float64, queue_size=1)
        self.publishers_array["shoulder_pan_joint"] = self._shoulder_pan_pub

        self._shoulder_lift_pub = rospy.Publisher(
            '/ur3/shoulder_lift_joint_position_controller/command', Float64, queue_size=1)
        self.publishers_array["shoulder_lift_joint"] = self._shoulder_lift_pub

        self._elbow_pub = rospy.Publisher(
            '/ur3/elbow_joint_position_controller/command', Float64, queue_size=1)
        self.publishers_array["elbow_joint"] = self._elbow_pub

        self._wrist1_pub = rospy.Publisher(
            '/ur3/wrist_1_joint_position_controller/command', Float64, queue_size=1)
        self.publishers_array["wrist_1_joint"] = self._wrist1_pub

        self._wrist2_pub = rospy.Publisher(
            '/ur3/wrist_2_joint_position_controller/command', Float64, queue_size=1)
        self.publishers_array["wrist_2_joint"] = self._wrist2_pub

        self._wrist3_pub = rospy.Publisher(
            '/ur3/wrist_3_joint_position_controller/command', Float64, queue_size=1)
        self.publishers_array["wrist_3_joint"] = self._wrist3_pub

        rospy.Subscriber("/ur3/joint_states",
                         JointState, self.joints_callback)
        
        
        #All the controllers
        self.controllers_list = ['joint_state_controller',        
                'shoulder_pan_joint_position_controller',
                'shoulder_lift_joint_position_controller',
                'elbow_joint_position_controller',
                'wrist_1_joint_position_controller',
                'wrist_2_joint_position_controller',
                'wrist_3_joint_position_controller',
                                     ]
        
        self.robot_name_space = "ur3"
        self.reset_controls = True
        
        self.steps_beyond_done = None
        self._tolerance = rospy.get_param('/ur3/tolerance')
        self._wait_time = rospy.get_param('/ur3/wait_time')

        super(UR3Env, self).__init__(controllers_list=self.controllers_list,
                                             robot_name_space=self.robot_name_space,
                                             reset_controls=self.reset_controls,
                                             start_init_physics_parameters=False,
                                             reset_world_or_sim="WORLD")
        
    
     


    """
    Define subscriber callback function(s)
    Define necessary RobotEnv methods
    """

     #Callback function for joint states
    def joints_callback(self, data):
        #Position is the only thing I am interested in
        self.joints = data.position

    def _seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed]

    def _env_setup(self, initial_qpos):
        self.init_internal_vars(self.init_pos)
        self._set_init_pose()
        self._check_all_systems_ready()

    def init_internal_vars(self, init_pos_value):
        #Adding copy as otherwise the value will be overriden by another process
        #and the arm will not return to start position and you will have to 
        #use the workaround of extra step with action 10
        self.pos = init_pos_value.copy()
        self.joints = None

    #Publisher readiness
    def check_publishers_connection(self):
        """
        Checks that all the publishers are working
        """
        rate = rospy.Rate(10)  # 10hz
        while (self._elbow_pub.get_num_connections() == 0 and not rospy.is_shutdown()):
            rospy.logdebug(
                "No susbribers to _elbow_pub yet so we wait and try again")
            try:
                rate.sleep()
            except rospy.ROSInterruptException:
                # This is to avoid error when world is rested, time when backwards.
                pass
        rospy.logdebug("_elbow_pub Publisher Connected")

        while (self._shoulder_lift_pub.get_num_connections() == 0 and not rospy.is_shutdown()):
            rospy.logdebug(
                "No susbribers to _shoulder_lift_pub yet so we wait and try again")
            try:
                rate.sleep()
            except rospy.ROSInterruptException:
                # This is to avoid error when world is rested, time when backwards.
                pass
        rospy.logdebug("_shoulder_lift_pub Publisher Connected")

        while (self._shoulder_pan_pub.get_num_connections() == 0 and not rospy.is_shutdown()):
            rospy.logdebug(
                "No susbribers to _shoulder_pan_pub yet so we wait and try again")
            try:
                rate.sleep()
            except rospy.ROSInterruptException:
                # This is to avoid error when world is rested, time when backwards.
                pass
        rospy.logdebug("_shoulder_pan_pub Publisher Connected")

        while (self._wrist1_pub.get_num_connections() == 0 and not rospy.is_shutdown()):
            rospy.logdebug(
                "No susbribers to _wrist_1_pub yet so we wait and try again")
            try:
                rate.sleep()
            except rospy.ROSInterruptException:
                # This is to avoid error when world is rested, time when backwards.
                pass
        rospy.logdebug("_wrist_1_pub Publisher Connected")

        while (self._wrist2_pub.get_num_connections() == 0 and not rospy.is_shutdown()):
            rospy.logdebug(
                "No susbribers to _wrist_2_pub yet so we wait and try again")
            try:
                rate.sleep()
            except rospy.ROSInterruptException:
                # This is to avoid error when world is rested, time when backwards.
                pass
        rospy.logdebug("_wrist_2_pub Publisher Connected")

        while (self._wrist3_pub.get_num_connections() == 0 and not rospy.is_shutdown()):
            rospy.logdebug(
                "No susbribers to _wrist_3_pub yet so we wait and try again")
            try:
                rate.sleep()
            except rospy.ROSInterruptException:
                # This is to avoid error when world is rested, time when backwards.
                pass
        rospy.logdebug("_wrist_3_pub Publisher Connected")

        rospy.logdebug("All Publishers READY")


    #System readiness
    def _check_all_systems_ready(self, init=True):
        self.base_position = None
        while self.base_position is None and not rospy.is_shutdown():
            try:
                self.base_position = rospy.wait_for_message(
                    "/ur3/joint_states", JointState, timeout=1.0)
                rospy.logdebug(
                    "Current /ur3/joint_states READY=>"+str(self.base_position))
                if init:
                    # We Check all the sensors are in their initial values
                    positions_ok = all(
                        abs(i) <= 1.0e-02 for i in self.base_position.position)
                    
                    base_data_ok = positions_ok 
                    rospy.logdebug(
                        "Checking Init Values Ok=>" + str(base_data_ok))
            except:
                rospy.logerr(
                    "Current /ur3/joint_states not ready yet, retrying for getting joint_states")
                
        rospy.logdebug("ALL SYSTEMS READY")

    #Function to facilitate the check if the arm has arrived at the desired position +- tolerance
    def _check_joints_position(self, joints_array):
        #Probably a begining and the call back still has not happened
        if self.joints is None:
            rospy.logwarn("No subscription to /ur3/joint_states, assuming start")
            rospy.sleep(self._wait_time) 
            return True
        
        if ((abs(joints_array["elbow_joint"] - self.joints[0]) <= self._tolerance) and 
            abs(joints_array["shoulder_lift_joint"] - self.joints[1]) <= self._tolerance and 
            abs(joints_array["shoulder_pan_joint"] - self.joints[2]) <= self._tolerance):
            return True
        
        return False
    
    #Move the joints, joints array is a dictionary of joint:position
    def move_joints(self, joints_array):
        for k, v in joints_array.items():
            joint_value = Float64()
            joint_value.data = v
            rospy.logdebug("Move {} to {}.".format(k, str(joint_value)))
            self.publishers_array[k].publish(joint_value)
        #Assign timeout to 1s, the value could possibly go the the config
        timeout = rospy.get_time() + 1 #1s max timeouut
        rospy.logdebug(timeout)
        #Loop until either the arm is in position, or the timeout occurs
        while True:
            if self._check_joints_position(joints_array):
                rospy.logdebug("In position")
                break
            if rospy.get_time() > timeout:
                rospy.logwarn("Arm not in position after timeout, possible joint stuck")
                break
            



            

    def get_clock_time(self):
        self.clock_time = None
        while self.clock_time is None and not rospy.is_shutdown():
            try:
                self.clock_time = rospy.wait_for_message(
                    "/clock", Clock, timeout=1.0)
                rospy.logdebug("Current clock_time READY=>" +
                               str(self.clock_time))
            except:
                rospy.logdebug(
                    "Current clock_time not ready yet, retrying for getting Current clock_time")
        return self.clock_time