#! /usr/bin/env python

import rospy
import actionlib
from assignment1.msg import ConveyorGoal, ConveyorFeedback, ConveyorResult, ConveyorAction

def feedbackCallback(feedback):
    rospy.loginfo("Feedback received")

rospy.init_node("Conveyor_ClientNode")
client = actionlib.SimpleActionClient("/startConveyor", ConveyorAction)
client.wait_for_server()
rospy.loginfo("Server found")
goal = ConveyorGoal()
goal.maxSpawns = 20
client.send_goal(goal, feedback_cb=feedbackCallback)
client.wait_for_result()
client.wait_for_result()
#result = client.get_result()
rospy.loginfo("Done")