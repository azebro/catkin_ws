#! /usr/bin/env python

import rospy
import actionlib

from math import  sqrt, atan2, pi, pow


from geometry_msgs.msg import Twist
from std_srvs.srv import *
from turtlesim.msg import *
from turtlesim.srv import *
from assignment1.msg import HuntTurtleResult, HuntTurtleFeedback, HuntTurtleAction, HuntTurtleGoal

mainTurtle = Pose()
targetTurtle = Pose()
motion = Twist()
pub = None



def hunt(goal):
    global pub
    hunter = "/" + goal.hunterName + "/pose"
    rospy.Subscriber(hunter, Pose, mainPose)
    rospy.Subscriber("/" + goal.targetName + "/pose", Pose, targetPose)
    pub = rospy.Publisher("/" + goal.hunterName + "/cmd_vel", Twist, queue_size = 10)
    removeTurtle = rospy.ServiceProxy("/kill", Kill)
    hunt = True
    initialDistance = getDistance(mainTurtle.x, mainTurtle.y, targetTurtle.x, targetTurtle.y)
    feedback = HuntTurtleFeedback()
    while hunt:
        distance = getDistance(mainTurtle.x, mainTurtle.y, targetTurtle.x, targetTurtle.y)
        if distance <= 1:
            rospy.loginfo("Found turtle: " + goal.targetName)
            removeTurtle(goal.hunterName)
            hunt = False

        else:
            findThetaMethod()
        
        progressBar, progress = prepareProgressBar(initialDistance, distance)
        feedback.progressBar = progressBar
        feedback.progress = progress
        actionServer.publish_feedback(feedback)
        rospy.loginfo("Progress: " + progressBar)
        rate.sleep()
    result = HuntTurtleResult()
    result.status = "OK"
    result.time = 1.4
    actionServer.set_succeeded(result, "OK")
    
def prepareProgressBar(initialDistance, currentDistance):
    progress = 1 - currentDistance / initialDistance
    progressStep = int(round(progress * 10))
    rospy.loginfo("Progress: " + str(progressStep))
    progressBar = '|{}|'.format("=" * progressStep + "." * (10 - progressStep))
    return progressBar, progress
    
def findThetaMethod():
    global motion
    targetTheta = atan2(targetTurtle.y - mainTurtle.y, targetTurtle.x - mainTurtle.x)
    if (targetTheta < 0):
        targetTheta += 2 * pi
    if (abs(targetTheta - mainTurtle.theta) < 0.1):
        motion.linear.x = 1
        motion.angular.z = 0
    else:
        motion.linear.x = 0
        motion.angular.z = 3
    pub.publish(motion)

def getDistance(x1, y1, x2, y2):
    return sqrt(pow((x2-x1),2) + pow((y2-y1),2))


def mainPose(data):
    global mainTurtle
    mainTurtle.x = data.x
    mainTurtle.y = data.y
    mainTurtle.theta = data.theta


def targetPose(data):
    global targetTurtle
    targetTurtle.x = data.x
    targetTurtle.y = data.y
    targetTurtle.theta = data.theta


rospy.init_node("hunter")
actionName = "huntTurtle"
rate = rospy.Rate(30)
 
actionServer = actionlib.SimpleActionServer(actionName, HuntTurtleAction, execute_cb=hunt, auto_start = False)
actionServer.start()
rospy.spin()