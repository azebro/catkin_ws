#! /usr/bin/env python
# coding: utf-8 
import rospy
rospy.init_node("Rodney2")
rate = rospy.Rate(2) # create a Rate object of 2Hz
while not rospy.is_shutdown(): # Endless loop until Ctrl + C
 print "We don’t serve fine wine in half-pints, buddy"
 rate.sleep() # sleep the needed time to maintain the Rate fixed above