#! /usr/bin/env python

import rospy
import actionlib
from  std_msgs.msg import Float64


rospy.init_node("my_ur3_reach")
rate = rospy.Rate(30)
command= "/ur3/{}_position_controller/command"
run = True
setup = False
prompts = {
        1: "shoulder_pan_joint", 
        2: "shoulder_lift_joint", 
        3: "elbow_joint", 
        4: "wrist_1_joint",
        5: "wrist_2_joint",
        6: "wrist_3_joint",
        7: "Exit"}

def executeMove(joint, position):
    fl = Float64()
    fl.data = float(position)
    joint.publish(fl)
    return


publishers = []
for joint in prompts.values():
    uri = command.format(joint)
    pub = rospy.Publisher(uri, Float64, queue_size = 10)
    publishers.append(pub)

counter = 1
while not rospy.is_shutdown() :
    for pub in publishers:
       executeMove(pub, 0)
       counter +=1
    
       
    rate.sleep()
    
rospy.loginfo("Robot zeroed")

while not rospy.is_shutdown() and run:
    

    print("Select joints to move: \n")
    for k, v in prompts.items():
        print("{}. {}".format(k, v))

   
    selection = int(input("Select joint: "))
    if selection == 7:
        run = False
    else:
        position = float(input("What position move {} to? ".format(prompts[selection])))
        pub = publishers[selection -1]
        fl = Float64()
        fl.data = position
        pub.publish(fl)
    
   
    rate.sleep()
