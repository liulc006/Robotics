#!/usr/bin/env python3

import math
import numpy
import rospy
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Transform
from cartesian_control.msg import CartesianCommand
from urdf_parser_py.urdf import URDF
import random
import tf
from threading import Thread, Lock

'''This is a class which will perform both cartesian control and inverse
   kinematics'''
class CCIK(object):
    def __init__(self):
    #Load robot from parameter server
        self.robot = URDF.from_parameter_server()

    #Subscribe to current joint state of the robot
        rospy.Subscriber('/joint_states', JointState, self.get_joint_state)

    #This will load information about the joints of the robot
        self.num_joints = 0
        self.joint_names = []
        self.q_current = []
        self.joint_axes = []
        self.get_joint_info()

    #This is a mutex
        self.mutex = Lock()

    #Subscribers and publishers for for cartesian control
        rospy.Subscriber('/cartesian_command', CartesianCommand, self.get_cartesian_command)
        self.velocity_pub = rospy.Publisher('/joint_velocities', JointState, queue_size=10)
        self.joint_velocity_msg = JointState()

        #Subscribers and publishers for numerical IK
        rospy.Subscriber('/ik_command', Transform, self.get_ik_command)
        self.joint_command_pub = rospy.Publisher('/joint_command', JointState, queue_size=10)
        self.joint_command_msg = JointState()

    '''This is a function which will collect information about the robot which
       has been loaded from the parameter server. It will populate the variables
       self.num_joints (the number of joints), self.joint_names and
       self.joint_axes (the axes around which the joints rotate)'''
    def get_joint_info(self):
        link = self.robot.get_root()
        while True:
            if link not in self.robot.child_map: break
            (joint_name, next_link) = self.robot.child_map[link][0]
            current_joint = self.robot.joint_map[joint_name]
            if current_joint.type != 'fixed':
                self.num_joints = self.num_joints + 1
                self.joint_names.append(current_joint.name)
                self.joint_axes.append(current_joint.axis)
            link = next_link

    '''This is the callback which will be executed when the cartesian control
       recieves a new command. The command will contain information about the
       secondary objective and the target q0. At the end of this callback, 
       you should publish to the /joint_velocities topic.'''
    def get_cartesian_command(self, command):
        self.mutex.acquire()
        #--------------------------------------------------------------------------
        #FILL IN YOUR PART OF THE CODE FOR CARTESIAN CONTROL HERE
        command_tr =[command.x_target.translation.x,
                    command.x_target.translation.y ,
                    command.x_target.translation.z]

        command_rot = [command.x_target.rotation.x, command.x_target.rotation.y, 
                        command.x_target.rotation.z, command.x_target.rotation.w]

        tr = tf.transformations.translation_matrix(command_tr)
        rot = tf.transformations.quaternion_matrix(command_rot)
        b_T_ee_desired = numpy.dot(tr,rot)#checkmark desired transform matrix

        self.q_current = self.q_current #checkmark

        joint_transforms, b_T_ee = self.forward_kinematics(self.q_current) ##checkmark current

        dx_T = numpy.dot(numpy.linalg.inv(b_T_ee),b_T_ee_desired) #change delta X

        dx = numpy.zeros((6,1)) #initialize 0 vectors
        for i in range(3):
            dx[i] = dx_T[i,3] #adding translation into dx
        
        angle, axis = self.rotation_from_matrix(dx_T) # axis(vector 3x1)and angle(scalar)
        rot = axis * angle

        for i in range(3):
            dx[i+3] = rot[i]  #adding rotation into dx

        p = 2 #gain
        v_ee = p*dx #velocity of end-effector (gain * dx)
        J = self.get_jacobian(b_T_ee, joint_transforms)
        q_dot = numpy.dot(numpy.linalg.pinv(J,1e-2),v_ee)
        scale = 1
        q_dot = q_dot * scale

        if command.secondary_objective == True:
            r0 = command.q0_target
            gain = 3
            q_sec = numpy.zeros((self.num_joints,1))
            q_sec[0] = gain*(r0-q_dot[0])

            I = numpy.identity(self.num_joints)
            q_null = numpy.dot((I-numpy.dot(numpy.linalg.pinv(J,0),J)),q_sec)

            q_dot = numpy.dot(numpy.linalg.pinv(J,0),v_ee) + q_null

        ### Publish the calculated joint velocities
        self.joint_velocity_msg.name = self.joint_names
        self.joint_velocity_msg.velocity = q_dot
        self.velocity_pub.publish(self.joint_velocity_msg)
        #--------------------------------------------------------------------------
        self.mutex.release()

    '''This is a function which will assemble the jacobian of the robot using the
       current joint transforms and the transform from the base to the end
       effector (b_T_ee). Both the cartesian control callback and the
       inverse kinematics callback will make use of this function.
       Usage: J = self.get_jacobian(b_T_ee, joint_transforms)'''
    def get_jacobian(self, b_T_ee, joint_transforms):
        J = numpy.zeros((6,self.num_joints))
        #--------------------------------------------------------------------------
        #FILL IN YOUR PART OF THE CODE FOR ASSEMBLING THE CURRENT JACOBIAN HERE
        for j in range(self.num_joints):
            b_T_j = joint_transforms[j] #transform from base to EACH joint
            ee_T_b = numpy.linalg.inv(b_T_ee)
            ee_T_j = numpy.dot(ee_T_b,b_T_j)
            j_T_ee = numpy.linalg.inv(ee_T_j)

            ee_R_j = ee_T_j[:3,:3]
            zero = numpy.zeros((3,3))
            j_t_ee = j_T_ee[:3,3]
            S = [[0,-1*j_t_ee[2],j_t_ee[1]],
                 [j_t_ee[2],0,-1*j_t_ee[0]],
                 [-1*j_t_ee[1],j_t_ee[0],0]]

            V_j = numpy.concatenate((numpy.concatenate((ee_R_j, numpy.dot(-1*ee_R_j,S)),axis=1),
                                    numpy.concatenate((zero, ee_R_j),axis=1)),axis=0) 

            if self.joint_axes[j][0] == 1:# rotation about x
                axis = 3
                sign = 1
            elif self.joint_axes[j][1] == 1:# rotation about y
                axis = 4
                sign = 1
            elif self.joint_axes[j][2] == 1:# rotation about z
                axis = 5
                sign = 1
            elif self.joint_axes[j][0] == -1:# rotation about -x
                axis = 3
                sign = -1
            elif self.joint_axes[j][1] == -1:# rotation about -y
                axis = 4
                sign = -1
            elif self.joint_axes[j][2] == -1:# rotation about -z
                axis = 5
                sign = -1
            else:
                axis = [] #error

            for row in range(6):
                J[row][j] = V_j[row,axis].reshape(-1,1)*sign

        #print("++++")
        #print(J.shape)
        #print("++++")
        #--------------------------------------------------------------------------
        return J

    '''This is the callback which will be executed when the inverse kinematics
       recieve a new command. The command will contain information about desired
       end effector pose relative to the root of your robot. At the end of this
       callback, you should publish to the /joint_command topic. This should not
       search for a solution indefinitely - there should be a time limit. When
       searching for two matrices which are the same, we expect numerical
       precision of 10e-3.'''
    def get_ik_command(self, command):
        self.mutex.acquire()
        #--------------------------------------------------------------------------
        #FILL IN YOUR PART OF THE CODE FOR INVERSE KINEMATICS HERE
        command_tr =[command.translation.x,
                    command.translation.y ,
                    command.translation.z]

        command_rot = [command.rotation.x, command.rotation.y, 
                        command.rotation.z, command.rotation.w]

        tr = tf.transformations.translation_matrix(command_tr)
        rot = tf.transformations.quaternion_matrix(command_rot)
        b_T_ee_desired = numpy.dot(tr,rot)

        X_desired = numpy.zeros((6,1))
        angle1, axis1 = self.rotation_from_matrix(b_T_ee_desired)
        vect1 = angle1*axis1
        for i in range(3):
            X_desired[i] = tf.transformations.translation_from_matrix(b_T_ee_desired)[i]
            X_desired[i+3] = vect1[i]

        IK = 0
        start = rospy.get_time()
        time = 0
        iteration = 5000
        count = 0
        print("IK Processing...")

        while  time < 11 and IK==0 and count < 3:
            q_c = numpy.random.randn(self.num_joints,1)
            count += 1
            print("Guess:",count)
            for i in range(iteration):
                joint_transforms, b_T_ee = self.forward_kinematics(q_c)

                X_c = numpy.zeros((6,1))
                angle2, axis2 = self.rotation_from_matrix(b_T_ee_desired)
                vect2 = angle2*axis2
                for i in range(3):
                    X_c[i] = tf.transformations.translation_from_matrix(b_T_ee)[i]
                    X_c[i+3] = vect2[i]

                error = numpy.around((X_desired - X_c), decimals = 3)
                
                J = self.get_jacobian(b_T_ee, joint_transforms)
                delta_q = numpy.dot(numpy.linalg.pinv(J,1e-2),error)
                q_c = q_c + delta_q

                end = rospy.get_time()
                time = int(end - start)

                if all(error==0) == True:
                    print("===============")
                    print("IK Found")
                    print("Time: %s secs"%time)
                    print("===============")
                    IK = 1
                    self.joint_command_msg.name = self.joint_names
                    self.joint_command_msg.position= q_c
                    self.joint_command_pub.publish(self.joint_command_msg)
                    break
                elif time == 10:
                    break
        if IK == 0:
            print("===============")
            print("IK NOT FOUND!")
            print("%s secs Time Out" %time)
            print("===============")
        #--------------------------------------------------------------------------
        self.mutex.release()

    '''This function will return the angle-axis representation of the rotation
       contained in the input matrix. Use like this: 
       angle, axis = rotation_from_matrix(R)'''
    def rotation_from_matrix(self, matrix):
        R = numpy.array(matrix, dtype=numpy.float64, copy=False)
        R33 = R[:3, :3]
        # axis: unit eigenvector of R33 corresponding to eigenvalue of 1
        l, W = numpy.linalg.eig(R33.T)
        i = numpy.where(abs(numpy.real(l) - 1.0) < 1e-8)[0]
        if not len(i):
            raise ValueError("no unit eigenvector corresponding to eigenvalue 1")
        axis = numpy.real(W[:, i[-1]]).squeeze()
        # point: unit eigenvector of R33 corresponding to eigenvalue of 1
        l, Q = numpy.linalg.eig(R)
        i = numpy.where(abs(numpy.real(l) - 1.0) < 1e-8)[0]
        if not len(i):
            raise ValueError("no unit eigenvector corresponding to eigenvalue 1")
        # rotation angle depending on axis
        cosa = (numpy.trace(R33) - 1.0) / 2.0
        if abs(axis[2]) > 1e-8:
            sina = (R[1, 0] + (cosa-1.0)*axis[0]*axis[1]) / axis[2]
        elif abs(axis[1]) > 1e-8:
            sina = (R[0, 2] + (cosa-1.0)*axis[0]*axis[2]) / axis[1]
        else:
            sina = (R[2, 1] + (cosa-1.0)*axis[1]*axis[2]) / axis[0]
        angle = math.atan2(sina, cosa)
        return angle, axis

    '''This is the function which will perform forward kinematics for your 
       cartesian control and inverse kinematics functions. It takes as input
       joint values for the robot and will return an array of 4x4 transforms
       from the base to each joint of the robot, as well as the transform from
       the base to the end effector.
       Usage: joint_transforms, b_T_ee = self.forward_kinematics(joint_values)'''
    def forward_kinematics(self, joint_values):
        joint_transforms = []

        link = self.robot.get_root()
        T = tf.transformations.identity_matrix()

        while True:
            if link not in self.robot.child_map:
                break

            (joint_name, next_link) = self.robot.child_map[link][0]
            joint = self.robot.joint_map[joint_name]

            T_l = numpy.dot(tf.transformations.translation_matrix(joint.origin.xyz), tf.transformations.euler_matrix(joint.origin.rpy[0], joint.origin.rpy[1], joint.origin.rpy[2]))
            T = numpy.dot(T, T_l)

            if joint.type != "fixed":
                joint_transforms.append(T)
                q_index = self.joint_names.index(joint_name)
                T_j = tf.transformations.rotation_matrix(joint_values[q_index], numpy.asarray(joint.axis))
                T = numpy.dot(T, T_j)

            link = next_link
        return joint_transforms, T #where T = b_T_ee

    '''This is the callback which will recieve and store the current robot
       joint states.'''
    def get_joint_state(self, msg):
        self.mutex.acquire()
        self.q_current = []
        for name in self.joint_names:
            self.q_current.append(msg.position[msg.name.index(name)])
        self.mutex.release()


if __name__ == '__main__':
    rospy.init_node('cartesian_control_and_IK', anonymous=True)
    CCIK()
    rospy.spin()
