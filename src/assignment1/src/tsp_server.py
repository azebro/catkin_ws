#! /usr/bin/env python

import numpy as np
import rospy
from assignment1.srv import TspList, TspListResponse


def calculateTSP(request):
    rospy.loginfo("Calculate TSP called")
    turtleList = np.array(request.turtles)
    tspList = findPath(turtleList)
    response = TspListResponse()
    response.sequence = tspList[:,0].tolist()
    rospy.loginfo("TSP calculation completed")

def findPath(turtles):
    idx = 0
    notVisited = turtles[turtles[:,3] != idx][:,3].tolist()
    tsp = np.array([[0,0]])
    while notVisited:
        currentX = turtles[turtles[:,3] == idx][0,0]
        currentY = turtles[turtles[:,3] == idx][0,1]
        remainingTurtles = turtles[np.isin(turtles[:,3], notVisited)]
        distance = np.array([remainingTurtles[:,3], np.around(np.sqrt(np.square(remainingTurtles[:,0] - currentX) +  np.square(remainingTurtles[:,1] - currentY)))])
        tsp = np.append(tsp, np.array([ [distance[0][distance[1].argmin()], distance[1].min()]]), axis=0)
        notVisited.remove(distance[0][distance[1].argmin()])
        idx = int(distance[0][distance[1].argmin()])
    return tsp


rospy.init_node("TSP_server")
sceneService = rospy.Service("/calculate_tsp", TspList, calculateTSP)
scene = TspList()
rospy.spin()
