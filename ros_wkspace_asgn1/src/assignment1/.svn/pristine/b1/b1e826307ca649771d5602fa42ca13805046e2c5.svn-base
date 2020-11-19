#!/usr/bin/env python3  
import rospy

import numpy as np

import tf
import tf2_ros
import geometry_msgs.msg

def vectors_angle(u,v): #Dot product formula to calculate the angle(in radians) between 2 vectors
    dot = np.dot(u[0],v[0])
    norm_product = np.linalg.norm(u) * np.linalg.norm(v)
    angle = np.arccos(dot/norm_product) #angle in radian
    return angle

def translation_vector_form(vector): #function that reshapes vector vertically and adds/appends '1' 
    new_vector = vector.reshape(len(vector),1)
    new_vector = np.vstack((new_vector,1))
    return new_vector


def publish_transforms():
    ##############################################################################################
    #1. Base frame to Object Frame
    #### (roll, pitch, yaw) = (0.64, 0.64, 0), Translation(x,y,z) = (1.5m,0.8mm,0m)###
    t1 = geometry_msgs.msg.TransformStamped()
    t1.header.stamp = rospy.Time.now()
    t1.header.frame_id = "base_frame"
    t1.child_frame_id = "object_frame"
    q1 = tf.transformations.quaternion_from_euler(0.64, 0.64, 0.0)
    r_m1 = tf.transformations.quaternion_matrix(q1) #Get matrix from quaterion about rotation
    t1.transform.rotation.x = q1[0]
    t1.transform.rotation.y = q1[1]
    t1.transform.rotation.z = q1[2]
    t1.transform.rotation.w = q1[3]
    tr_m1 = tf.transformations.translation_matrix((1.5, 0.8, 0.0))#Converting translation from axis to matrix

    MRT1 = np.dot(r_m1,tr_m1) #Getting Rotation followed by Translation

    RT1 = tf.transformations.translation_from_matrix(MRT1)#Getting translation from RT matrix
    t1.transform.translation.x = RT1[0]
    t1.transform.translation.y = RT1[1]
    t1.transform.translation.z = RT1[2]
    br.sendTransform(t1)
    ##############################################################################################

    ##############################################################################################
    #2. Base frame to Robot frame
    t2 = geometry_msgs.msg.TransformStamped()
    t2.header.stamp = rospy.Time.now()
    t2.header.frame_id = "base_frame"
    t2.child_frame_id = "robot_frame"
    q2 = tf.transformations.quaternion_about_axis(1.5, (0,1,0))
    r_m2 = tf.transformations.quaternion_matrix(q2) #getting rotation quaternion matrix
    t2.transform.rotation.x = q2[0]
    t2.transform.rotation.y = q2[1]
    t2.transform.rotation.z = q2[2]
    t2.transform.rotation.w = q2[3]
    tr_m2 = tf.transformations.translation_matrix((0,0,-2))#Converting translation into Matrix

    MRT2 = np.dot(r_m2,tr_m2) #Calculating Rotation follow by translation

    RT2 = tf.transformations.translation_from_matrix(MRT2) #getting translation from final matrix transf
    t2.transform.translation.x = RT2[0]
    t2.transform.translation.y = RT2[1]
    t2.transform.translation.z = RT2[2]
    br.sendTransform(t2)
    ##############################################################################################
    
    ##############################################################################################
    #3. Robot frame to Camera frame (camera attached to robot)
    t3 = geometry_msgs.msg.TransformStamped()
    t3.header.stamp = rospy.Time.now()
    t3.header.frame_id = "robot_frame"
    t3.child_frame_id = "camera_frame"

    tr_m3 = tf.transformations.translation_matrix((0.3, 0.0, 0.3))
    tr_3 = tf.transformations.translation_from_matrix(tr_m3)
    t3.transform.translation.x = tr_3[0]
    t3.transform.translation.y = tr_3[1]
    t3.transform.translation.z = tr_3[2]

    ###############################################################################################
    #3a. find the rotation of the camera frame so that the x-axis is pointing to the object_frame origin
    ###############################################################################################
    obj_base = translation_vector_form(RT1) #object position in base frame (just given coordinates)
    MRT2_inverse = tf.transformations.inverse_matrix(MRT2)
    obj_robot = np.dot(MRT2_inverse,obj_base) #object position in robot frame
    MRT3_inverse = tf.transformations.inverse_matrix(tr_m3)
    obj_camera = np.dot(MRT3_inverse, obj_robot) #object position in camera frame

    camera_x = np.array([[1],[0],[0]]) #vector form of x-axis in camera frame

    #calculate the smallest angle between the 2 vectors
    angle = vectors_angle(camera_x, obj_camera[0:3,:]) #Angle (in radians) between 2 vectors
    #calculate the axis of rotation between 2 vectors 
    axis_vector = np.cross(camera_x.T, obj_camera[0:3,:].T) #Axis (in vector form) of rotation between 2 vectors
    ###############################################################################################
    ###############################################################################################

    q3 = tf.transformations.quaternion_about_axis(angle, axis_vector)
    t3.transform.rotation.x = q3[0]
    t3.transform.rotation.y = q3[1]
    t3.transform.rotation.z = q3[2]
    t3.transform.rotation.w = q3[3]
    br.sendTransform(t3)
    ##############################################################################################

#    #TESTING: Vector to visualize that the x-axis is actually pointing/crossing the object_frame origin
#    t4 = geometry_msgs.msg.TransformStamped()
#    t4.header.stamp = rospy.Time.now()
#    t4.header.frame_id = "camera_frame"
#    t4.child_frame_id = "TESTING"
#    t4.transform.translation.x = 6
#    t4.transform.translation.y = 0
#    t4.transform.translation.z = 0
#    q4 = tf.transformations.quaternion_from_euler(0,0,0)
#    t4.transform.rotation.x = q4[0]
#    t4.transform.rotation.y = q4[1]
#    t4.transform.rotation.z = q4[2]
#    t4.transform.rotation.w = q4[3]
#    br.sendTransform(t4)


if __name__ == '__main__':
    rospy.init_node('solutions')
    first = True
    br = tf2_ros.TransformBroadcaster()
    rospy.sleep(0.1)

    while not rospy.is_shutdown():
        publish_transforms()
        rospy.sleep(0.1)
