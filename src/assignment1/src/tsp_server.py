#! /usr/bin/env python

import numpy as np
import rospy
import pickle
from assignment1.srv import Tsp, TspResponse

#Calculate the route of the hunter turtle
def calculateTSP(request):
    rospy.loginfo("Calculate TSP called")
    turtleList = pickle.loads(request.turtles)
    rospy.loginfo(turtleList.shape)
    tspList = findPath(turtleList)
    response = TspResponse()
    rospy.loginfo("TSP calculated")
    #Need to pickle to be able to pass the array back
    output = pickle.dumps(tspList[:,0], protocol=0)
    response.sequence = output
    rospy.loginfo("TSP calculation completed and pickled")
    return response
#Find the shortest path
def findPath(turtles):
    idx = turtles[0,3]
    notVisited = turtles[turtles[:,3] != idx][:,3].tolist()
    #rospy.loginfo(notVisited)
    #rospy.loginfo(turtles[turtles[:,3] == idx])

    tsp = np.array([[idx,0]])
    while notVisited:
        currentX = turtles[turtles[:,3] == idx][0,0]
        currentY = turtles[turtles[:,3] == idx][0,1]
        remainingTurtles = turtles[np.isin(turtles[:,3], notVisited)]
        #Euclidian distance
        distance = np.array([remainingTurtles[:,3], np.around(np.sqrt(np.square(remainingTurtles[:,0] - currentX) +  np.square(remainingTurtles[:,1] - currentY)))])
        #Append to the list
        tsp = np.append(tsp, np.array([ [distance[0][distance[1].argmin()], distance[1].min()]]), axis=0)
        notVisited.remove(distance[0][distance[1].argmin()])
        idx = int(distance[0][distance[1].argmin()])
    return tsp


rospy.init_node("TSP_server")
sceneService = rospy.Service("/calculate_tsp", Tsp, calculateTSP)
scene = Tsp()
rospy.spin()
