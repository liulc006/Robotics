from arm_dynamics_base import ArmDynamicsBase
import numpy as np
from geometry import rot, xaxis, yaxis

class ArmDynamicsStudent(ArmDynamicsBase):

    def dynamics_step(self, state, action, dt):
        # state has the following format: [q_0, ..., q_(n-1), qdot_0, ..., qdot_(n-1)] where n is the number of links
        # action has the following format: [mu_0, ..., mu_(n-1)]
        # You can make use of the additional variables:
        # self.num_links: the number of links
        # self.joint_viscous_friction: the coefficient of viscous friction
        # self.link_lengths: an array containing the lengths of all the links
        # self.link_masses: an array containing the masses of all the links

        
        # Replace this with your code:
        #return state

        ###1 LINK###
        if self.num_links == 1:
            a1 = -1*self.link_masses[0]*self.link_lengths[0]*0.5
            a2 = -0.5*self.link_lengths[0]
            a3 = (-1/12)*self.link_masses[0]*(self.link_lengths[0]**2)

            g = 9.81#self.gravity
            world_angle = state[0]

            b12 = self.link_masses[0]*(0.5*self.link_lengths[0]*(state[0]**2)*(np.array([[-1],[0]]))-g*(
                np.dot(np.array([[np.cos(world_angle),-1*np.sin(world_angle)],
                                [np.sin(world_angle),np.cos(world_angle)]]).reshape(2,2),np.array([[0],[-1]])))) 
            
            #B Matrix#
            B = np.zeros((7,1))
            B[0,0] = b12[0]
            B[1,0] = b12[1]
            B[4,0] = self.joint_viscous_friction*state[1]
            B[6,0] = action[0]
            ##########

            #A Matrix#
            A = np.eye(7)
            A[1,4] = a1
            A[4,1] = a2
            A[4,4] = a3
            A[4,6] = 1
            A[5,4] = -1
            ##########
            
            #Solver#
            x = np.linalg.solve(A,B)
            ########

            ######Euler Integration###### for link 1
            new_q_dot = state[1] + x[5,0]*self.dt
            new_q = state[0] + state[1]*self.dt + (0.5*x[5,0]*(self.dt**2))

            new_state = np.array([new_q,new_q_dot])
            #############################

            return new_state
        
        ### 2 LINKS ###
        elif self.num_links == 2:
            g = 9.81

            #Matrix A
            A = np.eye(16)
            A[2,0] = -1*np.cos(state[1])
            A[3,0] = np.sin(state[1])
            A[6,0] = -1*self.link_masses[0]
            A[2,1] = -1*np.sin(state[1])
            A[3,1] = -1*np.cos(state[1])
            A[7,1] = -1*self.link_masses[0]
            A[10,2] = -1*self.link_masses[1]
            A[11,2] = -1*self.link_masses[1]
            A[6,4] = -1
            A[7,5] = -1
            A[7,12] = -0.5*self.link_lengths[0]
            A[8,4] = -1*np.cos(state[1])
            A[8,5] = -1*np.sin(state[1])
            A[8,12] = np.sin(state[1])
            A[9,4] = np.sin(state[1])
            A[9,5] = -1*np.cos(state[1])
            A[9,12] = -1*np.cos(state[1])
            A[10,8] = -1
            A[11,9] = -1
            A[11,13] = -0.5*self.link_lengths[1]
            A[12,1] = -0.5*self.link_lengths[0]
            A[12,2] = -0.5*self.link_lengths[0]*np.sin(state[1])
            A[12,3] = -0.5*self.link_lengths[0]*np.cos(state[1])
            A[12,12] = (-1/12)*self.link_masses[0]*(self.link_lengths[0]**2)
            A[13,3] = -0.5*self.link_lengths[1]
            A[13,13] = (-1/12)*self.link_masses[1]*(self.link_lengths[1]**2)
            A[14,12] = -1
            A[15,12] = 1
            A[15,13] = -1
            ######


            #Matrix B
            R_0w = np.array([[np.cos(state[0]),np.sin(state[0])],
                             [-1*np.sin(state[0]),np.cos(state[0])]]).reshape(2,2)
            R_1w = np.array([[np.cos(state[0]+state[1]),np.sin(state[0]+state[1])],
                             [-1*np.sin(state[0]+state[1]),np.cos(state[0]+state[1])]]).reshape(2,2)
            neg_y = np.array([[0],[-1]])
            b12 = -1*self.link_masses[0]*g*np.dot(R_0w, neg_y)
            b34 = -1*self.link_masses[1]*g*np.dot(R_1w, neg_y)

            B = np.zeros((16,1))
            B[0,0] = b12[0]
            B[1,0] = b12[1]
            B[2,0] = b34[0]
            B[3,0] = b34[1]
            B[6,0] = -0.5*self.link_lengths[0]*(state[2]**2)
            B[8,0] = -1*self.link_lengths[0]*(state[2]**2)*np.cos(state[1])
            B[9,0] = self.link_lengths[0] *(state[2]**2)*np.sin(state[1])
            B[10,0] = -0.5*self.link_lengths[1]*((state[2]*state[3])**2) 
            B[12,0] = self.joint_viscous_friction*state[2] + action[1] - action[0]
            B[13,0] = self.joint_viscous_friction*state[3] - action[1]
            ########
            
            #Solver#
            x = np.linalg.solve(A,B)
            ########

            #Euler Integration#
            new_q_dot0 = state[2] + x[14,0]*self.dt
            new_q_dot1 = state[3] + x[15,0]*self.dt
            new_q0 = state[0] + state[2]*self.dt + (0.5*x[14,0]*(self.dt**2))
            new_q1 = state[1] + state[3]*self.dt + (0.5*x[15,0]*(self.dt**2))

            new_state = np.array([new_q0, new_q1,new_q_dot0, new_q_dot1])
            ###################
            return new_state

        #3 Links
        elif self.num_links == 3:
            g = 9.81

            #Matrix A
            A = np.eye(24)
            A[18,1] = -0.5 * self.link_lengths[0]
            A[0,2] = -1 * np.cos(state[1])
            A[1,2] = -1 * np.sin(state[1])
            A[18,2] = -0.5 * self.link_lengths[0] * np.sin(state[1])
            A[0,3] = np.sin(state[1])
            A[1,3] = -1*np.cos(state[1])
            A[18,3] = -0.5*self.link_lengths[0]*np.cos(state[1])
            A[19,3] = -0.5*self.link_lengths[1]
            A[2,4] = -1 * np.cos(state[2])
            A[3,4] = -1 * np.sin(state[2])
            A[19,4] = -0.5 * self.link_lengths[1] * np.sin(state[2])
            A[2,5] = np.sin(state[2])
            A[3,5] = -1*np.cos(state[2])
            A[19,5] = -0.5*self.link_lengths[1]*np.cos(state[2])
            A[20,5] = -0.5*self.link_lengths[2]
            A[8,6] = -1
            A[10,6] = -1 * np.cos(state[1])
            A[11,6] = np.sin(state[1])
            A[9,7] = -1
            A[10,7] = -1*np.sin(state[1])
            A[11,7] = -1 * np.cos(state[1])
            A[0,8] = -1*self.link_masses[0]   
            A[1,9] = -1*self.link_masses[0]
            A[12,10] = -1     
            A[14,10] = -1 * np.cos(state[2])
            A[15,10] = np.sin(state[2])
            A[13,11] = -1
            A[14,11] = -1*np.sin(state[2])
            A[15,11] = -1 * np.cos(state[2])
            A[2,12] = -1*self.link_masses[1]   
            A[3,13] = -1*self.link_masses[1]
            A[16,14] = -1
            A[17,15] = -1
            A[4,16] = -1*self.link_masses[2]   
            A[5,17] = -1*self.link_masses[2]
            A[9,18] = -0.5*self.link_lengths[0]
            A[10,18] = -1*self.link_lengths[0]*np.sin(state[1])
            A[11,18] = -1*self.link_lengths[0]*np.cos(state[1])
            A[18,18] = (-1/12)*self.link_masses[0]*(self.link_lengths[0]**2)
            A[21,18] = -1
            A[22,18] =  1
            A[13,19] = -0.5*self.link_lengths[1]
            A[14,19] = -1*self.link_lengths[1]*np.sin(state[2])
            A[15,19] = -1*self.link_lengths[1]*np.cos(state[2])
            A[19,19] = (-1/12)*self.link_masses[1]*(self.link_lengths[1]**2)
            A[22,19] = -1
            A[23,19] =  1
            A[17,20] = -0.5*self.link_lengths[2]
            A[20,20] = (-1/12)*self.link_masses[2]*(self.link_lengths[2]**2)
            A[23,20] = -1
            #####################

            #Matrix B
            R_0w = np.array([[np.cos(state[0]),np.sin(state[0])],
                             [-1*np.sin(state[0]),np.cos(state[0])]]).reshape(2,2)

            R_1w = np.array([[np.cos(state[0]+state[1]),np.sin(state[0]+state[1])],
                             [-1*np.sin(state[0]+state[1]),np.cos(state[0]+state[1])]]).reshape(2,2)

            R_2w = np.array([[np.cos(state[0]+state[1]+state[2]),np.sin(state[0]+state[1]+state[2])],
                             [-1*np.sin(state[0]+state[1]+state[2]),np.cos(state[0]+state[1]+state[2])]]).reshape(2,2)
            neg_y = np.array([[0],[-1]])

            b12 = -1*self.link_masses[0]*g*np.dot(R_0w, neg_y)
            b34 = -1*self.link_masses[1]*g*np.dot(R_1w, neg_y)
            b56 = -1*self.link_masses[2]*g*np.dot(R_2w, neg_y)

            B = np.zeros((24,1))
            B[0,0] = b12[0]
            B[1,0] = b12[1]
            B[2,0] = b34[0]
            B[3,0] = b34[1]
            B[4,0] = b56[0]
            B[5,0] = b56[1]
            B[8,0] = -0.5 * self.link_lengths[0] * (state[3]**2)
            B[10,0] = -1*np.cos(state[1]) * self.link_lengths[0] * (state[3]**2)
            B[11,0] = np.sin(state[1]) * self.link_lengths[0] * (state[3]**2)
            B[12,0] = -0.5 * self.link_lengths[1] * ((state[4]+state[3])**2)
            B[14,0] = -1*np.cos(state[2]) * self.link_lengths[1] * ((state[4]+state[3])**2)
            B[15,0] = np.sin(state[2]) * self.link_lengths[1] * ((state[4]+state[3])**2)    
            B[16,0] = -0.5 * self.link_lengths[2] * ((state[5]+state[4]+state[3])**2)
            B[18,0] = action[1] - action [0] + (self.joint_viscous_friction*state[3])
            B[19,0] = action[2] - action [1] + (self.joint_viscous_friction*state[4])
            B[20,0] = (-1*action[2]) + (self.joint_viscous_friction*state[5])
            ##################
            
            #Solver
            x = np.linalg.solve(A,B)
            #########

            #Euler Integration
            new_q_dot0 = state[3] + x[21,0]*self.dt
            new_q_dot1 = state[4] + x[22,0]*self.dt
            new_q_dot2 = state[5] + x[23,0]*self.dt
            new_q0 = state[0] + state[3]*self.dt + (0.5*x[21,0]*(self.dt**2))
            new_q1 = state[1] + state[4]*self.dt + (0.5*x[22,0]*(self.dt**2))
            new_q2 = state[2] + state[5]*self.dt + (0.5*x[23,0]*(self.dt**2))

            new_state = np.array([new_q0, new_q1, new_q2, new_q_dot0, new_q_dot1, new_q_dot2])
            ###################
            return new_state

        else: 
            return state
