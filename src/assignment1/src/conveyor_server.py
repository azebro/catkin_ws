#! /usr/bin/env python

import rospy
import actionlib
import queue
import random
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
poseSubscribers = {}
queue = queue.Queue()
turtleSelected = False
currentTurtle = None
currentTurtlePose = Pose()
pickerTurtle = None
pickerTurtleSubscriber = None
pickerTurtlePose = Pose()
picketTurtleState = 0



def execute(goal):
    global spawnCounter, turtlesOnBelt, work, currentTurtle, currentTurtlePose, turtleSelected, pickerTurtle, pickerTurtlePose, poseSubscribers, pickerTurtleSubscriber
    turleBeltCouner = 1
    pickerTurtlePose.x = 5.5
    pickerTurtlePose.y = 3
    #Pointing down -pi/2
    pickerTurtlePose.theta = -1.5708

    #Spawn the picker turtle
    response = spawnTurtle.call("picker", 5.5, 3, -1.5708, False)
    pickerTurtleSubscriber = rospy.Subscriber("/" + response.name + "/pose", Pose, pickerTurtlePosition)
    pickerTurtle = rospy.Publisher("/picker/cmd_vel", Twist, queue_size = 10)
    #Check the max picks specified, if -1, assume infinite
    if goal.maxSpawns == -1:
        maxSpawns = 1000000
    else:
        maxSpawns = goal.maxSpawns
    while work:
        #Spawn belf in random intervals
        if spawnBelt():
            name = "belt" + str(turleBeltCouner)
            spawnTurtle.call(name, 0, 1, 0, False)
            pub = rospy.Publisher("/" + name + "/cmd_vel", Twist, queue_size = 10)
            turtlesOnBelt[name] = (pub)
            queue.put(name)
            turleBeltCouner += 1
            spawnCounter = 0
        #Move turtles on the belt
        for beltTurtle in turtlesOnBelt.values():
            moveTurtle(beltTurtle)
        #If not already aquired turtle, aquire a new one
        if not turtleSelected and picketTurtleState == 0 and not queue.empty():
            currentTurtle = queue.get()
            ps = rospy.Subscriber("/" + currentTurtle + "/pose", Pose, currentTurtlePosition)
            poseSubscribers[currentTurtle] = ps
            turtleSelected = True
        #Engage picker turtle
        engagePicker()

        spawnCounter += 1
        #If already done enough, exit
        if turleBeltCouner > maxSpawns:
            cleanup()
            work = False

        rate.sleep()
    result = ConveyorResult()
    result.message = "Conveyor completed. Turtles collected: " + str(turleBeltCouner)
    actionServer.set_succeeded(result=result, text="OK")

#Cleanup references 
def cleanup():
    global poseSubscribers, turtlesOnBelt, spawnTurtle, removeTurtle, pickerTurtleSubscriber, pickerTurtle
    for n, v in poseSubscribers.items():
        v.unregister()
        del poseSubscribers[n]
    for n, v in turtlesOnBelt.items():
        v.unregister()
        removeTurtle(n)
        del turtlesOnBelt[n]
    pickerTurtle.unregister()
    pickerTurtleSubscriber.unregister()
    spawnTurtle.close()
    removeTurtle.close()




#Spawn a turtle on the belt in random interval from 5 to 10 sec
def spawnBelt():
    global wait
    if spawnCounter >= frequency * wait:
        wait = random.randint(5, 10)
        return True
    return False

#Move turtle 
def moveTurtle(turtle):
    motion = Twist()
    motion.linear.x = 1
    motion.angular.z = 0
    motion.angular.y = 0
    turtle.publish(motion)

#Main picker evaluation method
def engagePicker():
    global turtleSelected, picketTurtleState, turtlesOnBelt, poseSubscribers
    if turtleSelected:
        #If turtle selected in range
        if 3.3 < currentTurtlePose.x < 3.5:
            picketTurtleState = 1
        x = pickerTurtlePose.x
        y = pickerTurtlePose.y

        #If picker and turtle on belt are close enough, assume a pick
        if  (x - 0.3 < currentTurtlePose.x < x + 0.3) and (y - 0.3 < currentTurtlePose.y < y + 0.3):
            picketTurtleState = 2
        #Kill the picked turtle
        if picketTurtleState == 2:
            turtlesOnBelt[currentTurtle].unregister()
            poseSubscribers[currentTurtle].unregister()
            removeTurtle(currentTurtle)
            #rospy.loginfo("killed: " + currentTurtle)

            del turtlesOnBelt[currentTurtle]
            del poseSubscribers[currentTurtle]
           
            movePicker(0)
            turtleSelected = False
        #Move picked down
        if picketTurtleState == 1:
            #rospy.loginfo("move picker")
            movePicker(1)
    else:
        #Move picker up
        if pickerTurtlePose.y < 2.9:
            #rospy.loginfo("move back")
            movePicker(-1)
        #Stop moving up
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