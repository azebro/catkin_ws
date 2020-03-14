#! /usr/bin/env python

import rospy
import actionlib
import random
import numpy as np
import pickle

from math import  sqrt

from geometry_msgs.msg import *
from std_srvs.srv import *
from turtlesim.msg import *
from turtlesim.srv import *
from assignment1.msg import StartAssignmentResult, StartAssignmentFeedback, StartAssignmentAction
from assignment1.srv import Tsp, TspResponse



def execute(goal):
    
    rospy.loginfo("Goal started" )
    clear()
    rospy.loginfo("Get main turtle, assuming turtle1")
    rospy.loginfo("Creating number of requested turtles: " + str(goal.numberOfTurtles))
    result = spawnTurtles(goal.numberOfTurtles)
    rospy.loginfo(result)
    pickled = pickle.dumps(np.concatenate((np.array([mainTurtle.x, mainTurtle.y, mainTurtle.theta, 1]).reshape(1,4), result), axis=0), protocol=0)
    tsp = Tsp()
    tsp.turtles = pickled
    route = calculateRoute(pickled)
    rospy.loginfo("Route received: " + str(route))
    
    
   
    output = StartAssignmentResult()
     
    output.turtlesCollected = str(result)
    #rospy.loginfo(outputList)
    actionServer.set_succeeded(output, "OK")


def getMainurtle():
    pass


def spawnTurtles(numberOfTurtles):
    turtlesList = []
    
    rospy.loginfo("Spawning targets")
    for i in range(2, numberOfTurtles+2):
        x = random.randint(1,10)
        y = random.randint(5,10)
        name = "turtle" + str(i)
        spawnTurtle(x, y, name)
        turtlesList.append([x, y, 0, i])
    rospy.loginfo("Targets created" + str(turtlesList))
    return np.array(turtlesList)

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
calculateRoute = rospy.ServiceProxy("/calculate_tsp", Tsp)
calculateRoute.wait_for_service()
removeTurtle = rospy.ServiceProxy("/kill", Kill)
clear = rospy.ServiceProxy("/clear", Empty)
actionServer = actionlib.SimpleActionServer(actionName, StartAssignmentAction, execute_cb=execute, auto_start = False)
actionServer.start()
rospy.spin()
