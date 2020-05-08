#!/usr/bin/env python


from gym import utils
from openai_ros.robot_envs import cartpole_env
from gym.envs.registration import register
from gym import error, spaces
import rospy
import math
import numpy as np
from openai_ros.task_envs.task_commons import LoadYamlFileParamsTest
from openai_ros.openai_ros_common import ROSLauncher
import os


class CartPoleStayUpEnv(ur3_env.UR3Env):
   def __init__(self):

        ros_ws_abspath = rospy.get_param("/cartpole_v0/ros_ws_abspath", None)
        assert ros_ws_abspath is not None, "You forgot to set ros_ws_abspath in your yaml file of your main RL script. Set ros_ws_abspath: \'YOUR/SIM_WS/PATH\'"
        assert os.path.exists(ros_ws_abspath), "The Simulation ROS Workspace path " + ros_ws_abspath + \
                                               " DOESNT exist, execute: mkdir -p " + ros_ws_abspath + \
                                               "/src;cd " + ros_ws_abspath + ";catkin_make"

        ROSLauncher(rospackage_name="cartpole_description",
                    launch_file_name="start_world.launch",
                    ros_ws_abspath=ros_ws_abspath)

        # Load Params from the desired Yaml file
        LoadYamlFileParamsTest(rospackage_name="openai_ros",
                               rel_path_from_package_to_file="src/openai_ros/task_envs/cartpole_stay_up/config",
                               yaml_file_name="stay_up.yaml")

        self.get_params()

        self.action_space = spaces.Discrete(self.n_actions)
        high = np.array([
            2.5 * 2,
            np.finfo(np.float32).max,
            0.7 * 2,
            np.finfo(np.float32).max])
        self.observation_space = spaces.Box(-high, high)

        # TODO: Remove when working
        """
        cartpole_env.CartPoleEnv.__init__(
            self, control_type=self.control_type
        )
        """

        # Here we will add any init functions prior to starting the MyRobotEnv
        super(CartPoleStayUpEnv, self).__init__(control_type=self.control_type,
                                                ros_ws_abspath=ros_ws_abspath)