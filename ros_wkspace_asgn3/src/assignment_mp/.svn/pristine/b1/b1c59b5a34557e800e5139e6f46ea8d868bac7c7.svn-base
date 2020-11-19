#!/bin/bash  

echo "Executing assignment in Xterm windows"

roslaunch assignment_mp grade_asgn_mp.launch robot_urdf_location:='$(find ur_description)/urdf/ur5_robot.urdf.xacro' robot:='ur5' &

sleep 5 
xterm -hold -e "rosrun assignment_mp AutoGrade_ur5.py"

sleep 2 
#Kill all ros nodes
killall -9 rosmaster


