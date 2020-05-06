#! /usr/bin/env python

import rospy
import actionlib
import tf
from  std_msgs.msg import Float64
from sensor_msgs.msg import JointState
from control_msgs.msg import JointControllerState

stateOfJoint = JointControllerState()
stateOfRobotsJoints = JointState()
jointSatateSubUri = "/ur3/{}_position_controller/state"


def jointState(data):
    global stateOfJoint
    stateOfJoint = data

def robotJointState(data):
    global stateOfRobotsJoints
    stateOfRobotsJoints = data



rospy.init_node("my_ur3_reach")
listener = tf.TransformListener()
rate = rospy.Rate(30)
stateOfJoint = JointState()
command= "/ur3/{}_position_controller/command"
jointStateSub = rospy.Subscriber("/ur3/joint_states", JointState, robotJointState)


    
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


while not rospy.is_shutdown() and run:
    

    print("Select joints to move: \n")
    for k, v in prompts.items():
        print("{}. {}".format(k, v))

   
    selection = int(input("Select joint: "))
    if selection == 7:
        run = False
    else:
        selectionName = prompts[selection]
        #jointStateSub = rospy.Subscriber(jointSatateSubUri.format(selectionName), JointControllerState, jointState)
        position = float(input("What position move {} to? ".format(selectionName)))
        pub = publishers[selection -1]
        fl = Float64()
        fl.data = position
        pub.publish(fl)
        rospy.sleep(1)
        index = stateOfRobotsJoints.name.index(prompts[selection])
        actualPosition = stateOfRobotsJoints.position[index]
        error = position - actualPosition
        (trans,rot) = listener.lookupTransform('wrist_3_link', 'base_link', rospy.Time(0))
    
        print("\nResult of the move:")
        print("Actual positon of {} is : {:.10f}".format(selectionName, actualPosition))
        print("Error in positon of {} is : {:.10f}\n".format(selectionName, error))
        print("End factor relative to base:")
        print("Position: x:{}, y:{}, z:{}".format(trans[0], trans[1], trans[2]))
        print("Orientation: x:{}, y:{}, z:{}, w:{}".format(rot[0], rot[1], rot[2], rot[3]))
        print("\n\n")
    
   
    rate.sleep()
