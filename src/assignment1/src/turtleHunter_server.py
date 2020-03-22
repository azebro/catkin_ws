#! /usr/bin/env python

import rospy
import actionlib

from math import  sqrt, atan2, pi, pow


from geometry_msgs.msg import Twist
from std_srvs.srv import *
from turtlesim.msg import *
from turtlesim.srv import *
from assignment1.msg import HuntTurtleResult, HuntTurtleFeedback, HuntTurtleAction, HuntTurtleGoal

#variable to contain the location and orientation of the main 'hunter' turtle
mainTurtle = Pose()
#variable containing the location and orientation of the currently targetted turtle
targetTurtle = Pose()
#main turtle movement/rotation
motion = Twist()
pub = None
#flag to indicate if the main turtle is aligned with its current target
thetaFound = False
#movement speed
linearSpeed = 1
speed = 1


#main delegate called when the action server is invoked
def hunt(goal):
    global pub, thetaFound, mainTurtle, targetTurtle, motion
    mainTurtle = Pose()
    targetTurtle = Pose()
    motion = Twist()
    pub = None
    thetaFound = False
    hunter = "/" + goal.hunterName + "/pose"
    rospy.Subscriber(hunter, Pose, mainPose)
    pub = rospy.Publisher("/" + goal.hunterName + "/cmd_vel", Twist, queue_size = 10)
    removeTurtle = rospy.ServiceProxy("/kill", Kill)
    hunt = True

    mainTurtle.x = goal.hunterX
    mainTurtle.y = goal.hunterY
    mainTurtle.theta = goal.hunterTheta
    targetTurtle.x = goal.targetX
    targetTurtle.y = goal.targetY
    targetTurtle.theta = goal.targetTheta
    #Calculate initial distance to the target turtle
    initialDistance = getDistance(mainTurtle.x, mainTurtle.y, targetTurtle.x, targetTurtle.y)
    #rospy.loginfo("Initial distance: " + str(initialDistance))
    feedback = HuntTurtleFeedback()
    while hunt:
        #Calculate distance to the currently targetted turtle, of the distance is withing a radius
        #consider that the turtle has been captured
        distance = getDistance(mainTurtle.x, mainTurtle.y, targetTurtle.x, targetTurtle.y)
        if distance <= 0.3:
            #main turtle close enough to the targetted one, consider hunt is over
            hunt = False
            moveTurtle(0)

        else:
            if not thetaFound:
                #if target theta is not aligned, keep looking
                findTheta()
            else:
                #if theta found, move the hunter
                moveTurtle()
                #calculate progress bar
                progressBar, progress, timeRemaining = prepareProgressBar(initialDistance, distance)
                #publish progress bar as feedback
                feedback.progressBar = progressBar
                feedback.progress = progress
                feedback.timeRemaining = str(timeRemaining)
                actionServer.publish_feedback(feedback)
                #log the progress as well as needed
                #rospy.loginfo("Progress: " + progressBar)
        
        #pause the loop for defined time
        rate.sleep()
    
    rospy.loginfo("Found turtle: " + goal.targetName)
    #turtle found, if it has to be removed (collected), do it
    if goal.kill:
        removeTurtle(goal.targetName)
        rospy.loginfo("killed: " + goal.targetName)
    #return result
    result = HuntTurtleResult()
    result.status = "OK"
    result.time = 0
    actionServer.set_succeeded(result, "OK")
    
#prepare the graphical status bar
def prepareProgressBar(initialDistance, currentDistance):
    
    #if on target, report 100%
    if initialDistance == 0:
        progress = 1
    else:
        progress = (initialDistance - currentDistance) / initialDistance 
    progressStep = int(round(progress * 10))
    #rospy.loginfo("Progress: " + str(progressStep))
    timeToTarget = currentDistance / linearSpeed
    progressBar = '|{}|'.format("=" * progressStep + "." * (10 - progressStep))
    return progressBar, progress, timeToTarget
    
#The turtle will rotate till in facing the target turtle
def findTheta():
    global motion, thetaFound
    targetTheta = atan2(targetTurtle.y - mainTurtle.y, targetTurtle.x - mainTurtle.x)

    #if hunter aligns, stop turning
    if (abs(targetTheta - mainTurtle.theta) < 0.02):
        
        thetaFound = True
    else:
        #keep turning until facing the target turtle.
        #This can be optimised to discover which direction to turn
        if not thetaFound:
            #rospy.loginfo("Theta else")
            motion.linear.x = 0
            motion.angular.z = 0.5
    pub.publish(motion)

#If turtle is aligned, start moving straight
def moveTurtle(speed = linearSpeed):
    global motion
    motion.linear.x = speed
    motion.angular.z = 0
    motion.angular.y = 0
    pub.publish(motion)

#Calculate euclidian distance
def getDistance(x1, y1, x2, y2):
    return sqrt(pow((x2-x1),2) + pow((y2-y1),2))


def mainPose(data):
    global mainTurtle
    mainTurtle.x = data.x
    mainTurtle.y = data.y
    mainTurtle.theta = data.theta



rospy.init_node("hunter")
actionName = "huntTurtle"
rate = rospy.Rate(30)
 
actionServer = actionlib.SimpleActionServer(actionName, HuntTurtleAction, execute_cb=hunt, auto_start = False)
actionServer.start()
rospy.spin()