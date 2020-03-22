#! /usr/bin/env python

import rospy
import actionlib
import random
import numpy as np
import pickle

from math import  sqrt, atan2, pi, pow

from geometry_msgs.msg import Twist
from std_srvs.srv import *
from turtlesim.msg import *
from turtlesim.srv import *
from assignment1.msg import StartAssignmentResult, StartAssignmentFeedback, StartAssignmentAction, HuntTurtleGoal, HuntTurtleFeedback, HuntTurtleResult, HuntTurtleAction, ConveyorGoal, ConveyorFeedback, ConveyorResult, ConveyorAction
from assignment1.srv import Tsp, TspResponse, TurtleSpawn, TurtleSpawnResponse

mainTurtle = Pose()

def execute(goal):
    global turtleTargetx, turtleTargety
    rospy.loginfo("Assignment 1 started" )
       
    rospy.loginfo("Creating number of requested turtles: " + str(goal.numberOfTurtles))
    
    #Spawn desired number of turtles
    result = spawnTurtles(goal.numberOfTurtles)
    rospy.loginfo("Targets created" + str(result))
    
    #Add the original position of the turtle as a last point of the route
    tspList = np.concatenate((np.array([mainTurtle.x, mainTurtle.y, mainTurtle.theta, 1]).reshape(1,4), result), axis=0)
    pickled = pickle.dumps(tspList, protocol=0)
    #Calculate all route including return to original position
    
    routePickled = calculateRoute(pickled)
    route = pickle.loads(routePickled.sequence)
    
    rospy.loginfo("Route received: " + str(route))
    
    conveyorClient = actionlib.SimpleActionClient("/startConveyor", ConveyorAction)
    conveyorClient.wait_for_server()
    rospy.loginfo("Conveyor server found")
    conveyorGoal = ConveyorGoal()
    #Spawn infinite number of belt turtles
    conveyorGoal.maxSpawns = -1
    conveyorClient.send_goal(conveyorGoal, feedback_cb=conveyorDone)
    #conveyorClient.stop_tracking_goal()
    rospy.loginfo("Get main turtle, assuming turtle1")


    huntClient = actionlib.SimpleActionClient("/huntTurtle", HuntTurtleAction)
    huntClient.wait_for_server()
    initialX = mainTurtle.x
    initialY = mainTurtle.y
    initialTheta = mainTurtle.theta
    rospy.loginfo("Hunt server found")
    #Hunt each turtle
    for i in range(0, len(result)):

     
        huntGoal = HuntTurtleGoal()
        huntGoal.hunterX = mainTurtle.x
        huntGoal.hunterY = mainTurtle.y
        huntGoal.hunterTheta = mainTurtle.theta
        huntGoal.hunterName = "turtle1"
        #rospy.loginfo("target X: " + str(result[result[:,3] == int(route[1])][0,0]))
        targetAttributes = result[result[:,3] == int(route[i+1])][0]
        huntGoal.targetX = targetAttributes[0]
        huntGoal.targetY = targetAttributes[1]
        huntGoal.targetTheta = targetAttributes[2]
        huntGoal.targetName = "turtle" + str(int(targetAttributes[3]))
        huntGoal.targetId = targetAttributes[3]
        huntGoal.kill = True
        rospy.loginfo("Processing turtle: " + "turtle" + str(int(targetAttributes[3])))
        huntClient.send_goal(huntGoal, feedback_cb=huntFeedback)
        huntClient.wait_for_result()
        

    huntGoal = HuntTurtleGoal()
    huntGoal.hunterX = mainTurtle.x
    huntGoal.hunterY = mainTurtle.y
    huntGoal.hunterTheta = mainTurtle.theta
    huntGoal.hunterName = "turtle1"
    
    #Return to the original position
    huntGoal.targetX = initialX
    huntGoal.targetY = initialY
    huntGoal.targetTheta = initialTheta
    huntGoal.targetName = "turtle1" 
    huntGoal.targetId = 1
    huntGoal.kill = False
    rospy.loginfo("Processing turtle: " + "turtle" + str(int(targetAttributes[3])))
    huntClient.send_goal(huntGoal, feedback_cb=huntFeedback)
    huntClient.wait_for_result()
    

   
    output = StartAssignmentResult()
     
    output.turtlesCollected = "OK"
    #rospy.loginfo(outputList)
    actionServer.set_succeeded(output, "OK")

def conveyorDone(a):
    pass

#Display the progress bar
def huntFeedback(feedback):
    rospy.loginfo(feedback.progressBar)
    rospy.loginfo("Time remaining to intercept: " + feedback.timeRemaining)


#Spawn turtles
def spawnTurtles(numberOfTurtles):
    turtlesList = []
    
    rospy.loginfo("Spawning targets")

    for i in range(2, numberOfTurtles+2):
        name = "turtle" + str(i)
        response = spawnTurtle.call(name, 0, 0, 0, True)
        turtlesList.append([response.x, response.y, response.theta, i])
    spawnTurtle.close()
    return np.array(turtlesList)



def mainPose(data):
    global mainTurtle
    mainTurtle.x = data.x
    mainTurtle.y = data.y
    mainTurtle.theta = data.theta


rospy.init_node("assignment")
rate = rospy.Rate(30)
mainTurtle = Pose()
actionName = "startAssignment"

spawnTurtle = rospy.ServiceProxy("/turtle_spawn", TurtleSpawn)

calculateRoute = rospy.ServiceProxy("/calculate_tsp", Tsp)
pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size = 10)
rospy.Subscriber("/turtle1/pose", Pose, mainPose)

motion = Twist()
calculateRoute.wait_for_service()
removeTurtle = rospy.ServiceProxy("/kill", Kill)
clear = rospy.ServiceProxy("/clear", Empty)
actionServer = actionlib.SimpleActionServer(actionName, StartAssignmentAction, execute_cb=execute, auto_start = False)
actionServer.start()
rospy.spin()
