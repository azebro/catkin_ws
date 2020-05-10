#! /usr/bin/env python

import rospy
import actionlib
import tf
from  std_msgs.msg import Float64
from sensor_msgs.msg import JointState
from control_msgs.msg import JointControllerState

#Varliables to store joint data
stateOfJoint = JointControllerState()
stateOfRobotsJoints = JointState()
#Topic for subscription for individual joint state
jointSatateSubUri = "/ur3/{}_position_controller/state"

#Joint state callback functions
def jointState(data):
    global stateOfJoint
    stateOfJoint = data

def robotJointState(data):
    global stateOfRobotsJoints
    stateOfRobotsJoints = data


#Init
rospy.init_node("my_ur3_reach")

#Initialise transformation listerer
listener = tf.TransformListener()

rate = rospy.Rate(30)
stateOfJoint = JointState()
#Command template for joint movement
command= "/ur3/{}_position_controller/command"
#Subscribe for joint states topic to get joint positions
jointStateSub = rospy.Subscriber("/ur3/joint_states", JointState, robotJointState)
  
#The user prompts
prompts = {
        1: "shoulder_pan_joint", 
        2: "shoulder_lift_joint", 
        3: "elbow_joint", 
        4: "wrist_1_joint",
        5: "wrist_2_joint",
        6: "wrist_3_joint",
        7: "Exit"}

#Move execution funtion
def executeMove(joint, position):
    fl = Float64()
    fl.data = float(position)
    joint.publish(fl)
    return

#Build a list of all joint bublishers
publishers = []
for joint in prompts.values():
    uri = command.format(joint)
    pub = rospy.Publisher(uri, Float64, queue_size = 1)
    publishers.append(pub)


while not rospy.is_shutdown() and run:
    

    print("Select joints to move: \n")
    for k, v in prompts.items():
        print("{}. {}".format(k, v))

   #If Exit then exit
    selection = int(input("Select joint: "))
    if selection == 7:
        run = False
    else:
        selectionName = prompts[selection]
        
        position = float(input("What position move {} to? ".format(selectionName)))
        #Select publisher based on the list built above
        pub = publishers[selection -1]
        fl = Float64()
        #Set target position and send command
        fl.data = position
        pub.publish(fl)
        #Letting the robot move, pause execution
        rospy.sleep(1)
        #Get the right index for the joint in the joint state message
        index = stateOfRobotsJoints.name.index(prompts[selection])
        #Get the position from positions array
        actualPosition = stateOfRobotsJoints.position[index]

        #I can obtain the same from this service /ur3/xxx_position_controller/state
        #where xxx is the joint name
        #but given that error ther is defined as:
        # process_value - set_point, I should receive the same outcome without 
        #additional call
        #but if wanted to implement that:
        #jointStateSub = rospy.Subscriber(jointSatateSubUri.format(selectionName), JointControllerState, jointState)
        #error = stateOfJoint.error
        error = position - actualPosition

        #Get the position and orientation
        (trans,rot) = listener.lookupTransform('wrist_3_link', 'base_link', rospy.Time(0))
        ### TODO: potentially add exception handling as per tf lab ~28.24min
        
        print("\nResult of the move:")
        print("Actual positon of {} is : {:.10f}".format(selectionName, actualPosition))
        print("Error in positon of {} is : {:.10f}\n".format(selectionName, error))
        print("End factor relative to base:")
        print("Position: x:{}, y:{}, z:{}".format(trans[0], trans[1], trans[2]))
        print("Orientation: x:{}, y:{}, z:{}, w:{}".format(rot[0], rot[1], rot[2], rot[3]))
        print("\n\n")
    
   
    rate.sleep()
