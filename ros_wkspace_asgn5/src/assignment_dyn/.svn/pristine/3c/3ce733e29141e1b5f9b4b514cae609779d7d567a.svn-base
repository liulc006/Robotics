import math
import numpy as np

import matplotlib.pyplot as plt
import matplotlib.lines as mlines
import matplotlib.colors as mcolors

import time
import threading
import os
from geometry import rot

class ArmGUI(object):

    def __init__(self, render_rate=50):
        self.robots = []
        self.rate = render_rate
        self.t = 0
        self.start_time = time.time()
        self.close_gui = False

    def add_robot(self, robot, color):
        self.robots.append((robot, color))

    def loop(self):
        self._fig = plt.figure(figsize=(10,10))
        self._ax1 = self._fig.add_subplot(1,1,1)
        plt.show(block=False)
        while self.close_gui is not True:
            t = time.time()
            self.plot()
            time.sleep(max(0, (1.0/self.rate)-(time.time()-t)))
        print("Bye!")
        
    def plot(self):
        self._ax1.clear()
        for robot in self.robots:
            self.plot_robot(*robot)

        # Clock based on last robot
        robot, _ = robot
        state = robot.get_state()
        mclock = round(robot.get_t(), 3)
        rclock = round(time.time()-self.start_time, 3)
        s = "Model clock: {}s \n".format(mclock) 
        s += "Real clock: {}s \n".format(rclock)


        num_links = robot.dynamics.get_num_links()
        link_lengths = robot.dynamics.get_link_lengths()
        robot_length = 0
        for i in range(0, num_links):
            robot_length += link_lengths[i]

        plt.text(x=-robot_length, y=robot_length, ha = 'left', va = 'top', s=s)

        self._fig.canvas.draw()

    def plot_robot(self, robot, color):

        p = np.zeros((2,1))
        R = np.eye(2)
        state = robot.get_state()
        q = robot.dynamics.get_q(state)
        pos_0 = robot.dynamics.get_pos_0(state)
        num_links = robot.dynamics.get_num_links()
        link_lengths = robot.dynamics.get_link_lengths()

        lim_x = 0
        lim_y = 0
        off_x, off_y = pos_0[0], pos_0[1]

        robot_length = 0
        for i in range(0, num_links):
            robot_length += link_lengths[i]
        plt.ylim(- 1.1 * robot_length, 1.1 * robot_length)
        plt.xlim(- 1.1 * robot_length, 1.1 * robot_length)
        
        for i in range(0, num_links):
            R = np.dot(R, rot(q[i]))
            l = np.zeros((2,1))
            l[0,0] = link_lengths[i]
            p_next = p + np.dot(R,l)
            self._ax1.add_line( mlines.Line2D(
                (off_x+p[0],off_x+p_next[0]), (off_y+p[1],off_y+p_next[1]), color=color))
            p = p_next

    def start(self):
        self.my_thread = threading.Thread(target=self.loop)
        self.my_thread.daemon = True
        self.my_thread.start()

    def close(self):
        self.close_gui = True
        self.my_thread.join()
        plt.close()
