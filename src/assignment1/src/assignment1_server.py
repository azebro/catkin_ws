#! /usr/bin/env python

import rospy
import actionlib
import random
import numpy as np

from math import  sqrt

from geometry_msgs.msg import *
from std_srvs.srv import *
from turtlesim.msg import *
from turtlesim.srv import *
from assignment1.msg import StartAssignmentResult, StartAssignmentFeedback, StartAssignmentAction


def execute(goal):
    
    rospy.loginfo("Goal started" )
    clear()
    rospy.loginfo("Get main turtle, assuming turtle1")
    rospy.loginfo("Creating number of requested turtles: " + str(goal.numberOfTurtles))
    result = spawnTurtles(goal.numberOfTurtles)
    rospy.loginfo(result)
   
    output = StartAssignmentResult()
     
    output.turtlesCollected = str(result)
    #rospy.loginfo(outputList)
    actionServer.set_succeeded(output, "OK")


def getMainurtle():
    pass


def spawnTurtles(numberOfTurtles):
    turtlesList = []
    
    rospy.loginfo("Spawning targets")
    for i in range(0, numberOfTurtles):
        x = random.randint(1,10)
        y = random.randint(5,10)
        name = "ct"+str(i)
        spawnTurtle(x, y, name)
        turtlesList.append([x, y, 0, name])
    rospy.loginfo("Targets created" + str(turtlesList))
    result = np.array(turtlesList)

    return result

def spawnTurtle(x, y, name, theta = 0):
    spawnService = rospy.ServiceProxy("/spawn", Spawn)
    spawnService(x, y, theta, name )

def mainPose(data):
    mainTurtle.x = data.x
    mainTurtle.y = data.y
    mainTurtle.theta = data.theta

def calculateDistance(x1, x2, y1, y2):

    distance =  sqrt( (x1 - x2)**2 + (y1 - y2)**2) 
    return distance



rospy.init_node("assignment")
mainTurtle = Pose()
actionName = "startAssignment"
rospy.Subscriber("/turtle1/pose", Pose, mainPose)
removeTurtle = rospy.ServiceProxy("/kill", Kill)
clear = rospy.ServiceProxy("/clear", Empty)
actionServer = actionlib.SimpleActionServer(actionName, StartAssignmentAction, execute_cb=execute, auto_start = False)
actionServer.start()
rospy.spin()
