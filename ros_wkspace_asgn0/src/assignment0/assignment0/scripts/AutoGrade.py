#!/usr/bin/env python3  

import sys
sys.path.append(".")

import numpy
import rospy, rostopic
from assignment0.msg import TwoInt
from std_msgs.msg import Int16
import time
import message_filters


def timeout(event):
    print("No numbers recieved. Timeout")

class Grader(object):
    def __init__(self):
        self.incorrect_sum = 0
        self.incorrect_numbers = 0
        self.correct_sums = 0

    def callback(self, numbers_msg, sum_msg):
        if numbers_msg.num1 + numbers_msg.num2 == sum_msg.data:
            self.correct_sums += 1
        else:
            self.incorrect_sum += 1

        if numbers_msg.num1 < 0 or numbers_msg.num2 < 0 or numbers_msg.num1 > 100 or numbers_msg.num2 > 100:
            self.incorrect_numbers += 1
        
def callback_hz(msg):
    pass


if __name__ == '__main__':
    rospy.init_node('assignment0_grader')

    grader = Grader()

    generator_sub = message_filters.Subscriber('/numbers', TwoInt)
    addition_sub = message_filters.Subscriber('/sum', Int16)
    ts = message_filters.ApproximateTimeSynchronizer([generator_sub, addition_sub], 10, .001, allow_headerless=True)
    ts.registerCallback(grader.callback)

    r = rostopic.ROSTopicHz(-1)
    s = rospy.Subscriber('/numbers', rospy.AnyMsg, r.callback_hz, callback_args='/numbers')

    rospy.sleep(0.5)

    rospy.Timer(rospy.Duration(10), timeout, True)

    if grader.correct_sums == 0 and grader.incorrect_sum == 0:
        print("Recieved no sums")
        final_grade = 0
    else:
        if grader.incorrect_sum == 0:
            print("Sums were correct")
        else:
            print("Sums were not correct")

        if grader.incorrect_numbers == 0:
            print("Incoming numbers were in correct range")
        else:
            print("Incoming numbers were not in correct range")

        print("Your average rate for generator.py should be about 10Hz: ")
        hz = r.print_hz(['/numbers'])


        final_grade = 0
        if grader.correct_sums > 0 and grader.incorrect_sum == 0:
            final_grade += 5
        if grader.incorrect_numbers == 0:
            final_grade +=5


    print("\n")
    print("Grade: %d"%final_grade)
