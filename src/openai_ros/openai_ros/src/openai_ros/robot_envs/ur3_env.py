"""
Add imports



This should include (among others):
    - message types required by publishers/subscribers
    - relevant openai_ros imports
"""
#!/usr/bin/env python

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
        # Seed the environment
        self._seed()
        self.steps_beyond_done = None

        super(UR3Env, self).__init__(controllers_list=self.controllers_list,
                                             robot_name_space=self.robot_name_space,
                                             reset_controls=self.reset_controls,
                                             start_init_physics_parameters=False,
                                             reset_world_or_sim="WORLD")
        
    

    def joints_callback(self, data):
        #rospy.loginfo(data)
        self.joints = data.position

    def _seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed]

    


    """
    Define subscriber callback function(s)
    Define necessary RobotEnv methods
    """

    def _env_setup(self, initial_qpos):
        self.init_internal_vars(self.init_pos)
        self.set_init_pose()
        self.check_all_systems_ready()

    def init_internal_vars(self, init_pos_value):
        self.pos = init_pos_value
        self.joints = None

    def check_publishers_connection(self):
        """
        Checks that all the publishers are working
        :return:
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


    
    
    def move_joints(self, joints_array):
        for k, v in joints_array.items():
            joint_value = Float64()
            joint_value.data = v
            rospy.logdebug("Move {} to {}.".format(k, str(joint_value)))
            self.publishers_array[k].publish(joint_value)
            #rospy.sleep(1)

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