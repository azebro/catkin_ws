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
from assignment1.msg import StartAssignmentResult, StartAssignmentFeedback, StartAssignmentAction, HuntTurtleGoal, HuntTurtleFeedback, HuntTurtleResult, HuntTurtleAction
from assignment1.srv import Tsp, TspResponse, TurtleSpawn, TurtleSpawnResponse

mainTurtle = Pose()

def execute(goal):
    global turtleTargetx, turtleTargety
    rospy.loginfo("Goal started" )
    #clear()
    
    rospy.loginfo("Get main turtle, assuming turtle1")
    rospy.loginfo("Creating number of requested turtles: " + str(goal.numberOfTurtles))
    
    result = spawnTurtles(goal.numberOfTurtles)
    rospy.loginfo("Targets created" + str(result))
    rospy.loginfo(result.shape)
    tspList = np.concatenate((np.array([mainTurtle.x, mainTurtle.y, mainTurtle.theta, 1]).reshape(1,4), result), axis=0)
    pickled = pickle.dumps(tspList, protocol=0)
    tsp = Tsp()
    tsp.turtles = pickled
    routePickled = calculateRoute(pickled)
    route = pickle.loads(routePickled.sequence)
    rospy.loginfo(route.shape)
    rospy.loginfo("Route received: " + str(route))
    #for i in range(2, goal.numberOfTurtles+2):
    #rospy.loginfo(result[int(route[1]),0])
    huntClient = actionlib.SimpleActionClient("/huntTurtle", HuntTurtleAction)
    huntClient.wait_for_server()
    initialX = mainTurtle.x
    initialY = mainTurtle.y
    initialTheta = mainTurtle.theta
    rospy.loginfo("Hunt server found")
    for i in range(0, len(result)):

        #targetTurtle = result[i,:]
        #turtleTargetx = targetTurtle[0]
        #turtleTargety = targetTurtle[1]
        
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
        huntGoal.targetName = "turtle" + str(targetAttributes[3])
        huntGoal.targetId = targetAttributes[3]
        huntGoal.kill = True
        rospy.loginfo("Processing turtle: " + "turtle" + str(targetAttributes[3]))
        huntClient.send_goal(huntGoal, feedback_cb=huntFeedback)
        huntClient.wait_for_result()
        res = huntClient.get_result()

    huntGoal = HuntTurtleGoal()
    huntGoal.hunterX = mainTurtle.x
    huntGoal.hunterY = mainTurtle.y
    huntGoal.hunterTheta = mainTurtle.theta
    huntGoal.hunterName = "turtle1"
    #rospy.loginfo("target X: " + str(result[result[:,3] == int(route[1])][0,0]))
    
    huntGoal.targetX = initialX
    huntGoal.targetY = initialY
    huntGoal.targetTheta = initialTheta
    huntGoal.targetName = "turtle1" 
    huntGoal.targetId = 1
    huntGoal.kill = False
    rospy.loginfo("Processing turtle: " + "turtle" + str(targetAttributes[3]))
    huntClient.send_goal(huntGoal, feedback_cb=huntFeedback)
    huntClient.wait_for_result()
    res = huntClient.get_result()

   
    output = StartAssignmentResult()
     
    output.turtlesCollected = res.status
    #rospy.loginfo(outputList)
    actionServer.set_succeeded(output, "OK")



    
def huntFeedback(feedback):
    rospy.loginfo(feedback.progressBar)


def getDistance(x1, y1, x2, y2):
    return sqrt(pow((x2-x1),2) + pow((y2-y1),2))

def getMainurtle():
    pass

def tutorialMethod(x1, x2, th1, y1, y2):
    m = Twist()
    targetTheta = atan2(y2 - y1, x2 - x1)
    m.linear.x = 1.5 * getDistance(x1, y1, x2, y2)
    m.angular.z = 4 * (targetTheta - th1) 
    pub.publish(m)




def spawnTurtles(numberOfTurtles):
    turtlesList = []
    
    rospy.loginfo("Spawning targets")

    for i in range(2, numberOfTurtles+2):
        x = random.randint(1,10)
        y = random.randint(5,10)
        name = "turtle" + str(i)
        spawnTurtle(x, y, name)
        turtlesList.append([x, y, 0, i])
    
    return np.array(turtlesList)

def spawnTurtle(x, y, name, theta = 0):
    spawnService = rospy.ServiceProxy("/spawn", Spawn)
    spawnService(x, y, theta, name )



def calculateDistance(x1, x2, y1, y2):

    distance =  sqrt( (x1 - x2)**2 + (y1 - y2)**2) 
    return distance

def mainPose(data):
    global mainTurtle
    mainTurtle.x = data.x
    mainTurtle.y = data.y
    mainTurtle.theta = data.theta

lastDistance = 100000
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
