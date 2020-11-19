#!/usr/bin/env python3

import rospy
from assignment0.msg import TwoInt
from std_msgs.msg import Int16

def callback(data):
    pub = rospy.Publisher('sum', Int16,queue_size = 10) #publish to topic "sum"
    rospy.init_node('adder', anonymous = True) #"adder" is published
    rate = rospy.Rate(20) #20Hz
#    while not rospy.is_shutdown():
    num1 = data.num1
    num2 = data.num2
    num3 = num1 + num2
    
#            print(msg)
    rospy.loginfo(num3)
    pub.publish(num3)
    rate.sleep()

def adder():
    rospy.init_node('adder', anonymous=True)
    rospy.Subscriber('numbers', TwoInt, callback)
    rospy.spin()
    
if __name__ == '__main__':
    try:
        adder()
    except rospy.ROSInterruptException:
        pass
