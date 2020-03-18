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
thetaFound = False



def hunt(goal):
    global pub, thetaFound, mainTurtle, targetTurtle, motion
    mainTurtle = Pose()
    targetTurtle = Pose()
    motion = Twist()
    pub = None
    thetaFound = False
    hunter = "/" + goal.hunterName + "/pose"
    rospy.Subscriber(hunter, Pose, mainPose)
    #rospy.Subscriber("/" + goal.targetName + "/pose", Pose, targetPose)
    pub = rospy.Publisher("/" + goal.hunterName + "/cmd_vel", Twist, queue_size = 10)
    removeTurtle = rospy.ServiceProxy("/kill", Kill)
    hunt = True

    mainTurtle.x = goal.hunterX
    mainTurtle.y = goal.hunterY
    mainTurtle.theta = goal.hunterTheta
    targetTurtle.x = goal.targetX
    targetTurtle.y = goal.targetY
    targetTurtle.theta = goal.targetTheta


    initialDistance = getDistance(mainTurtle.x, mainTurtle.y, targetTurtle.x, targetTurtle.y)
    rospy.loginfo("Initial distance: " + str(initialDistance))
    feedback = HuntTurtleFeedback()
    while hunt:
        distance = getDistance(mainTurtle.x, mainTurtle.y, targetTurtle.x, targetTurtle.y)
        if distance <= 0.3:
            
            hunt = False

        else:
            if not thetaFound:
                findThetaMethod()
            else:
                moveTurtle()
                progressBar, progress = prepareProgressBar(initialDistance, distance)
                feedback.progressBar = progressBar
                feedback.progress = progress
                actionServer.publish_feedback(feedback)
                rospy.loginfo("Progress: " + progressBar)
        
        
        rate.sleep()
    rospy.loginfo("Found turtle: " + goal.targetName)
    if goal.kill:
        removeTurtle(goal.targetName)
        rospy.loginfo("killed: " + goal.targetName)
    result = HuntTurtleResult()
    result.status = "OK"
    result.time = 1.4
    actionServer.set_succeeded(result, "OK")
    
def prepareProgressBar(initialDistance, currentDistance):
    
    if initialDistance == 0:
        progress = 1
    else:
        progress = 1 - currentDistance / initialDistance
    progressStep = int(round(progress * 10))
    #rospy.loginfo("Progress: " + str(progressStep))
    progressBar = '|{}|'.format("=" * progressStep + "." * (10 - progressStep))
    return progressBar, progress
    
def findThetaMethod():
    global motion, thetaFound
    targetTheta = atan2(targetTurtle.y - mainTurtle.y, targetTurtle.x - mainTurtle.x)
    
    if (abs(targetTheta - mainTurtle.theta) < 0.02):
        
        thetaFound = True
    else:
        if not thetaFound:
            #rospy.loginfo("Theta else")
            motion.linear.x = 0
            motion.angular.z = 0.5
    pub.publish(motion)

def moveTurtle():
    global motion
    motion.linear.x = 1
    motion.angular.z = 0
    motion.angular.y = 0
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