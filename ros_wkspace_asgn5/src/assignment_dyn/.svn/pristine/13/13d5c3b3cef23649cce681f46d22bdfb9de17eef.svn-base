import sys
import numpy as np
from arm_dynamics_teacher import ArmDynamicsTeacher
from arm_dynamics_student import ArmDynamicsStudent
from robot import Robot
from arm_gui import ArmGUI
import argparse
import time
import math

def main(args):

    def set_mu0(torque):
        action = np.zeros((dynamics_teacher.get_action_dim(), 1))
        action[0] = torque
        arm_teacher.set_action(action)
        arm_student.set_action(action)

    def set_q0(q):
        arm_teacher.state[0] = q
        arm_student.state[0] = q

    # Teacher arm
    dynamics_teacher = ArmDynamicsTeacher(
        num_links=args.num_links,
        link_mass=args.link_mass,
        link_length=args.link_length,
        joint_viscous_friction=args.friction,
        dt=args.time_step
        )
    arm_teacher  = Robot(dynamics_teacher)

    # Student arm 
    dynamics_student = ArmDynamicsStudent(
        num_links=args.num_links,
        link_mass=args.link_mass,
        link_length=args.link_length,
        joint_viscous_friction=args.friction,
        dt=args.time_step
        )
    arm_student = Robot(dynamics_student)

    if args.gui:
        gui = ArmGUI()
        gui.add_robot(arm_teacher, 'tab:blue')
        gui.add_robot(arm_student, 'tab:red')
        gui.start()

    torque = 0.75 * ((args.num_links-1)*(args.link_mass)*9.8*args.link_length + 0.5 * args.link_mass*9.8*args.link_length)
    set_mu0(torque)
    set_q0(-math.pi/2.0)
    
    dt = max(dynamics_teacher.dt, dynamics_student.dt)
    time.sleep(1)    
    while args.time_limit < 0 or arm_teacher.get_t() < args.time_limit:
        if arm_teacher.get_t() > 8.0 and torque > 0:
            torque = 0
            set_mu0(torque)
        t = time.time()
        arm_teacher.advance()
        arm_student.advance()
        time.sleep(max(0, dt - (time.time()-t)))
        
    if args.gui:
        gui.close()
        time.sleep(0.25)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--num_links', type=int, default=3)
    parser.add_argument('--link_mass', type=float, default=0.1)
    parser.add_argument('--link_length', type=float, default=1)
    parser.add_argument('--friction', type=float, default=0.1)
    parser.add_argument('--time_step', type=float, default=0.01)
    parser.add_argument('--time_limit', type=float, default=-1.0)
    parser.add_argument('--gui', action='store_const', const = True, default = False)
    main(parser.parse_args())











