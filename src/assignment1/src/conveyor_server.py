#! /usr/bin/env python

import rospy
import actionlib
import queue
from geometry_msgs.msg import Twist
from std_srvs.srv import *
from turtlesim.msg import *
from turtlesim.srv import *

from assignment1.srv import  TurtleSpawn, TurtleSpawnResponse
from assignment1.msg import ConveyorGoal, ConveyorFeedback, ConveyorResult, ConveyorAction

work = True
frequency = 20
wait = 5
spawnCounter = frequency * wait
turtlesOnBelt = {}
queue = queue.Queue()
turtleSelected = False
currentTurtle = None
currentTurtlePose = Pose()
pickerTurtle = None
pickerTurtlePose = Pose()
picketTurtleState = 0



def execute(goal):
    global spawnCounter, turtlesOnBelt, work, currentTurtle, currentTurtlePose, turtleSelected, pickerTurtle, pickerTurtlePose
    turleBeltCouner = 1
    pickerTurtlePose.x = 5.5
    pickerTurtlePose.y = 3
    pickerTurtlePose.theta = -1.5708

    response = spawnTurtle.call("picker", 5.5, 3, -1.5708, False)
    rospy.Subscriber("/" + response.name + "/pose", Pose, pickerTurtlePosition)
    pickerTurtle = rospy.Publisher("/picker/cmd_vel", Twist, queue_size = 10)
    while work:
        if spawnBelt():
            name = "belt" + str(turleBeltCouner)
            spawnTurtle.call(name, 0, 1, 0, False)
            pub = rospy.Publisher("/" + name + "/cmd_vel", Twist, queue_size = 10)
            turtlesOnBelt[name] = (pub)
            queue.put(name)
            turleBeltCouner += 1
            spawnCounter = 0
        for beltTurtle in turtlesOnBelt.values():
            moveTurtle(beltTurtle)
        if not turtleSelected and picketTurtleState == 0 and not queue.empty():
            currentTurtle = queue.get()
            rospy.Subscriber("/" + currentTurtle + "/pose", Pose, currentTurtlePosition)
            turtleSelected = True

        engagePicker()

        spawnCounter += 1
        
        if turleBeltCouner > goal.maxSpawns:
            work = False

        rate.sleep()
        

def spawnBelt():
    if spawnCounter >= frequency * wait:
        return True
    return False

def moveTurtle(turtle):
    motion = Twist()
    motion.linear.x = 1
    motion.angular.z = 0
    motion.angular.y = 0
    turtle.publish(motion)

def engagePicker():
    global turtleSelected, picketTurtleState, turtlesOnBelt
    if turtleSelected:
        if 3.3 < currentTurtlePose.x < 3.5:
            picketTurtleState = 1
        
        x = pickerTurtlePose.x
        y = pickerTurtlePose.y

        if  (x - 0.3 < currentTurtlePose.x < x + 0.3) and (y - 0.3 < currentTurtlePose.y < y + 0.3):
            picketTurtleState = 2

        if picketTurtleState == 2:
            removeTurtle(currentTurtle)
            rospy.loginfo("killed: " + currentTurtle)
            del turtlesOnBelt[currentTurtle]
            rospy.loginfo("coordinates: " + str(pickerTurtlePose.x) + str(pickerTurtlePose.y)+ str(pickerTurtlePose.theta))
            movePicker(0)
            turtleSelected = False

        if picketTurtleState == 1:
            rospy.loginfo("move picker")
            movePicker(1)
    else:
        if pickerTurtlePose.y < 2.9:
            rospy.loginfo("move back")
            movePicker(-1)
        if  2.9 <= pickerTurtlePose.y < 3.0:
            picketTurtleState = 0
            movePicker(0)
    
def pickerTurtlePosition(data):
    global pickerTurtlePose
    pickerTurtlePose.x = data.x
    pickerTurtlePose.y = data.y
    pickerTurtlePose.theta = data.theta

def currentTurtlePosition(data):
    global currentTurtlePose
    currentTurtlePose.x = data.x
    currentTurtlePose.y = data.y
    currentTurtlePose.theta = data.theta

def movePicker(x):
    motion = Twist()
    motion.linear.x = x
    pickerTurtle.publish(motion)

        
rospy.init_node("conveyor")
actionName = "startConveyor"
rate = rospy.Rate(frequency)
spawnTurtle = rospy.ServiceProxy("/turtle_spawn", TurtleSpawn)
removeTurtle = rospy.ServiceProxy("/kill", Kill)
actionServer = actionlib.SimpleActionServer(actionName, ConveyorAction, execute_cb=execute, auto_start = False)
actionServer.start()
rospy.spin()