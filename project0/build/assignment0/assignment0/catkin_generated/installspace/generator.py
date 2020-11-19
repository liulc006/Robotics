#!/usr/bin/env python3

import rospy
from assignment0.msg import TwoInt
import random

def generator():
    pub = rospy.Publisher('numbers', TwoInt,queue_size = 10) #publish to topic "numbers"
    rospy.init_node('generator', anonymous = True) #"generator" is published
    rate = rospy.Rate(20) #20Hz
    while not rospy.is_shutdown():
        msg = TwoInt()
        msg.num1 = random.randint(0,100)
        msg.num2 = random.randint(0,100)
#        print(msg)
        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        generator()
    except rospy.ROSInterruptException:
        pass
