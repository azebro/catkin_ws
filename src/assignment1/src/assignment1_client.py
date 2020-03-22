#! /usr/bin/env python

import rospy
import actionlib
import ast
import numpy as np
import random

from assignment1.msg import StartAssignmentResult, StartAssignmentFeedback, StartAssignmentAction, StartAssignmentGoal

def feedbackCallback(feedback):
    rospy.loginfo("Feedback received")

rospy.init_node("Assignment1_ClientNode")
client = actionlib.SimpleActionClient("/startAssignment", StartAssignmentAction)
client.wait_for_server()
rospy.loginfo("Server found")
goal = StartAssignmentGoal()
#Number of turtles to spawn
n = random.randint(5, 10)
goal.numberOfTurtles = n
client.send_goal(goal, feedback_cb=feedbackCallback)
client.wait_for_result()
result = client.get_result()
rospy.loginfo("Done " + str(result.turtlesCollected))
