#!/usr/bin/env python3

import numpy
import random
import sys

import geometry_msgs.msg
import moveit_msgs.msg
import moveit_msgs.srv
import rospy
import tf
import moveit_commander
from urdf_parser_py.urdf import URDF
from std_msgs.msg import String
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Transform
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint

def convert_to_message(T):
    t = geometry_msgs.msg.Pose()
    position = tf.transformations.translation_from_matrix(T)
    orientation = tf.transformations.quaternion_from_matrix(T)
    t.position.x = position[0]
    t.position.y = position[1]
    t.position.z = position[2]
    t.orientation.x = orientation[0]
    t.orientation.y = orientation[1]
    t.orientation.z = orientation[2]
    t.orientation.w = orientation[3]        
    return t

class MoveArm(object):

    def __init__(self):

        #Loads the robot model, which contains the robot's kinematics information
        self.num_joints = 0
        self.joint_names = []
        self.joint_axes = []
        self.robot = URDF.from_parameter_server()
        self.base = self.robot.get_root()
        self.get_joint_info()

        # Wait for moveit IK service
        rospy.wait_for_service("compute_ik")
        self.ik_service = rospy.ServiceProxy('compute_ik',  moveit_msgs.srv.GetPositionIK)
        print("IK service ready")

        # Wait for validity check service
        rospy.wait_for_service("check_state_validity")
        self.state_valid_service = rospy.ServiceProxy('check_state_validity',  
                                                      moveit_msgs.srv.GetStateValidity)
        print("State validity service ready")

        # MoveIt parameter
        robot_moveit = moveit_commander.RobotCommander()
        self.group_name = robot_moveit.get_group_names()[0]

        #Subscribe to topics
        rospy.Subscriber('/joint_states', JointState, self.get_joint_state)
        rospy.Subscriber('/motion_planning_goal', Transform, self.motion_planning)
        self.current_obstacle = "None"
        rospy.Subscriber('/obstacle', String, self.get_obstacle)

        #Set up publisher
        self.pub = rospy.Publisher('/joint_trajectory', JointTrajectory, queue_size=10)

    '''This callback provides you with the current joint positions of the robot 
     in member variable q_current.'''
    def get_joint_state(self, msg):
        self.q_current = []
        for name in self.joint_names:
            self.q_current.append(msg.position[msg.name.index(name)])

    '''This callback provides you with the name of the current obstacle which
    exists in the RVIZ environment. Options are "None", "Simple", "Hard",
    or "Super". '''
    def get_obstacle(self, msg):
        self.current_obstacle = msg.data

    '''This is the callback which will implement your RRT motion planning.
    You are welcome to add other functions to this class (i.e. an
    "is_segment_valid" function will likely come in handy multiple times 
    in the motion planning process and it will be easiest to make this a 
    seperate function and then call it from motion planning). You may also
    create trajectory shortcut and trajectory sample functions if you wish, 
    which will also be called from the motion planning function.'''    
    def motion_planning(self, ee_goal):
        print("Starting motion planning")
    ########INSERT YOUR RRT MOTION PLANNING HERE##########
        temp = (ee_goal.translation.x ,ee_goal.translation.y, ee_goal.translation.z)
        translation = tf.transformations.translation_matrix(temp)
        temp = (ee_goal.rotation.x ,ee_goal.rotation.y, ee_goal.rotation.z, ee_goal.rotation.w)
        rotation = tf.transformations.quaternion_matrix(temp)
        goal_T = numpy.dot(translation, rotation) #goal-point Transform 
        q_goal = numpy.array(self.IK(goal_T)).reshape(-1,1) #goal-point in Joint Space ##Note: 7 Joints

        self.q_current = self.q_current #start-point
        all_points = [] #waypoints storage
        all_points.append(numpy.array(self.q_current).reshape(-1,1))

        connected = False
        count = 0
        while connected == False:
            goal_connection, n = self.is_segment_valid(all_points[-1], q_goal, 600)
            #print("SLOW2")
            print("goal connected:", goal_connection)
            if goal_connection: #check if the last waypoint can be connected to goal
                connected = True
                break

            r = self.rand_q(len(self.q_current)) #random points sampling
            #[r.append(random.uniform(-1*numpy.pi,numpy.pi)) for i in range(len(self.q_current))]
            count += 1 #keeping track of the number of steps
            print("number of steps:", count)

            closest_point = self.closest_point(all_points,r) #finds the closest point's index

            segment_start = all_points[int(closest_point[0][0])].reshape(-1,1)
            segment_r = numpy.array(r).reshape(-1,1)
            v = segment_r-segment_start
            unit_vector = v/numpy.linalg.norm(v)
            length = 0.1 #predefined length of 0.1 for branches
            segment_end = segment_start + (unit_vector * length)

            validity, point = self.is_segment_valid(segment_start, segment_end, 250)
            #print("SLOW")
            while not validity:
                segment_end = point
                validity, point = self.is_segment_valid(segment_start, segment_end, 250)
            all_points.append(segment_end)
            if count == 1000:
                print("Time out")
                break

        print("Tree found")

        ###short-cutting thru waypoint###
        all_points.append(q_goal.reshape(-1,1))
        #short_path = all_points
        short_path = self.shortcut_points(all_points)
        #################################

        print('size:', len(all_points))
        path = short_path
        print("old n of points:", len(path))
        path = self.len_short_cutting(path)
        print("new n of points:", len(path))
        #a=path[-2]
        #b=path[-1]
        #u = numpy.linalg.norm(b-a)
        #print("DISTANCE AB:",u)

        msg = JointTrajectory()
        msg_points = JointTrajectoryPoint()
        msg.joint_names = self.joint_names
        for i in path:
            msg_points.positions = i
            msg.points = [msg_points]
            self.pub.publish(msg)

        print("end motion planning")
        print("########################")
    ######################################################

    #random sample joint values
    def rand_q(self,n_q):
        r=[]
        for i in range(n_q):
            r.append(random.uniform(-1*numpy.pi,numpy.pi))
        return r


    #get index and distance of closest point
    def closest_point(self,all_points, r):
        closest_q = numpy.zeros((1,2))
        for i in range(len(all_points)):
            start = numpy.array(all_points[i]).reshape(-1,1)
            end = numpy.array(r).reshape(-1,1)
            d = numpy.linalg.norm(start-end) #eucledian distance
            if d <= closest_q[0,1] or i == 0:
                closest_q = numpy.array([i,d]).reshape(1,-1) #return index and Eucledian distance of the closest point to r
        return closest_q

    #check segment is valid
    def is_segment_valid(self, q_start, q_end, n): 
        n_discretization = n
        v = numpy.subtract(q_end,q_start)
        #unit_vector = v/(numpy.linalg.norm(v))
        increm = v/n_discretization
        point = q_start #origin is start point
        validity = True
        for i in range(n_discretization):
            #print(i)
            point = numpy.add(point,increm)
            if not self.is_state_valid(point):
                #print("segment not valid")
                last_point = numpy.subtract(point,increm)
                #print("Last valid point", last_point)
                validity = False
                return validity, last_point

        return validity, point

    #shortcutting the segment for more waypoints (suggested distance between waypoints 0.5)
    def len_short_cutting(self, all_points):
        new_points = []
        #print(all_points[-1])
        for i in range(int(len(all_points)-1)): 
            start_q = all_points[i]
            end_q = all_points[i+1]
            v = end_q - start_q
            new_points.append(start_q)

            v_length = numpy.linalg.norm(v)
            #print(v_length)
            unit_vector = v/v_length
            spacing = 0.0001
            increment = unit_vector * spacing

            seg = start_q
            for j in range(int(numpy.floor(v_length/spacing))):
                seg = seg + increment
                new_points.append(seg)
            new_points.append(end_q)
        return new_points

    #waypoint short-cutting (make a smoother path)
    def shortcut_points(self, all_points):
        new_points = []
        new_points.append(all_points[0])
        index = 0
        count = 1
        list_point = 0
        while not list_point == int(len(all_points)-1):
            start_q = all_points[index]
            next_q = all_points[index+count]

            if not self.is_segment_valid(start_q, next_q, 1000):
                index = index+count-1 #index of last valid point
                new_points.append(all_points[index])
                count = 1

            count += 1
            list_point += 1

        new_points.append(all_points[-1])
        return new_points



    """ This function will perform IK for a given transform T of the end-effector.
    It returns a list q[] of values, which are the result positions for the 
    joints of the robot arm, ordered from proximal to distal. If no IK solution 
    is found, it returns an empy list.
    """
    def IK(self, T_goal):
        req = moveit_msgs.srv.GetPositionIKRequest()
        req.ik_request.group_name = self.group_name
        req.ik_request.robot_state = moveit_msgs.msg.RobotState()
        req.ik_request.robot_state.joint_state.name = self.joint_names
        req.ik_request.robot_state.joint_state.position = numpy.zeros(self.num_joints)
        req.ik_request.robot_state.joint_state.velocity = numpy.zeros(self.num_joints)
        req.ik_request.robot_state.joint_state.effort = numpy.zeros(self.num_joints)
        req.ik_request.robot_state.joint_state.header.stamp = rospy.get_rostime()
        req.ik_request.avoid_collisions = True
        req.ik_request.pose_stamped = geometry_msgs.msg.PoseStamped()
        req.ik_request.pose_stamped.header.frame_id = self.base
        req.ik_request.pose_stamped.header.stamp = rospy.get_rostime()
        req.ik_request.pose_stamped.pose = convert_to_message(T_goal)
        req.ik_request.timeout = rospy.Duration(3.0)
        res = self.ik_service(req)
        q = []
        if res.error_code.val == res.error_code.SUCCESS:
            q = res.solution.joint_state.position
        return q

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


    """ This function checks if a set of joint angles q[] creates a valid state,
    or one that is free of collisions. The values in q[] are assumed to be values
    for the joints of the KUKA arm, ordered from proximal to distal. 
    """
    def is_state_valid(self, q):
        req = moveit_msgs.srv.GetStateValidityRequest()
        req.group_name = self.group_name
        req.robot_state = moveit_msgs.msg.RobotState()
        req.robot_state.joint_state.name = self.joint_names
        req.robot_state.joint_state.position = q
        req.robot_state.joint_state.velocity = numpy.zeros(self.num_joints)
        req.robot_state.joint_state.effort = numpy.zeros(self.num_joints)
        req.robot_state.joint_state.header.stamp = rospy.get_rostime()
        res = self.state_valid_service(req)
        return res.valid


'''This is a class which you can use to keep track of your tree branches.
It is easiest to do this by appending instances of this class to a list 
(your 'tree'). The class has a parent field and a joint position field (q). 
You can initialize a new branch like this:
RRTBranch(parent, q)
Feel free to keep track of your branches in whatever way you want - this
is just one of many options available to you.'''
class RRTBranch(object):
    def __init__(self, parent, q):
        self.parent = parent
        self.q = q


if __name__ == '__main__':
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('move_arm', anonymous=True)
    ma = MoveArm()
    rospy.spin()

