"""
Add imports

This should include (among others):
    - message types required by publishers/subscribers
    - relevant openai_ros imports
"""


class UR3Env(robot_gazebo_env.RobotGazeboEnv):

    def __init__(self, ros_ws_abspath):

        """
        Start ROSlaunch that spawns the robot into the world
        Define ROS publishers, subscribers, controllers list and robot namespace
        Set reset_controls class variable to true
        """

        super(UR3Env, self).__init__(controllers_list=self.controllers_list,
                                             robot_name_space=self.robot_name_space,
                                             reset_controls=self.reset_controls,
                                             start_init_physics_parameters=False,
                                             reset_world_or_sim="WORLD")


    """
    Define subscriber callback function(s)
    Define necessary RobotEnv methods
    """


