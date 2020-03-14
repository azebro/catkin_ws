#! /usr/bin/env python

import rospy
import actionlib
import ast
import numpy as np

from assignment1.msg import StartAssignmentResult, StartAssignmentFeedback, StartAssignmentAction, StartAssignmentGoal

def feedbackCallback(feedback):
    rospy.loginfo("Feedback received")

rospy.init_node("Assignment1_ClientNode")
client = actionlib.SimpleActionClient("/startAssignment", StartAssignmentAction)
client.wait_for_server()
rospy.loginfo("Server found")
goal = StartAssignmentGoal()
goal.numberOfTurtles = 3
client.send_goal(goal, feedback_cb=feedbackCallback)
client.wait_for_result()
result = client.get_result()
#arr = ast.literal_eval(result.turtlesCollected)
arr2 = np.array(result.turtlesCollected)
print(arr2)
rospy.loginfo("Done " + str(result.turtlesCollected))