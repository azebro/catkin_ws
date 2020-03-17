#! /usr/bin/env python

import rospy
import random
from turtlesim.msg import *
from turtlesim.srv import *
from assignment1.srv import TurtleSpawn, TurtleSpawnResponse

def spawn(request):
    rospy.loginfo("Turtle Spawn called")
    if request.random:
        x = random.randint(1,10)
        y = random.randint(5,10)
    else:
        x = request.x
        y = request.y
    response = spawnService.call(x, y, request.theta, request.name )
    output = TurtleSpawnResponse()
    output.x = x
    output.y = y
    output.theta = request.theta
    output.name = response.name
    rospy.loginfo("Turtle Spawn finished for: " + response.name)
    return output
    

spawnService = rospy.ServiceProxy("/spawn", Spawn)
rospy.init_node("TurtleSpawn_server")
sceneService = rospy.Service("/turtle_spawn", TurtleSpawn, spawn)
rospy.spin()
