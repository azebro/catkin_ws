#! /usr/bin/env python
import rospy

from turtle_spawn.srv import InitialScene, InitialSceneResponse

def setScene(request):
    rospy.loginfo("setScene called")
    response = InitialSceneResponse()
    response.turtles = "aa"
    return response

rospy.init_node("service_server")
sceneService = rospy.Service("/set_initial_scene", InitialScene, setScene)
scene = InitialScene()
rospy.spin()