#!/bin/bash  

echo "Executing assignment in Xterm windows"

roslaunch assignment_mp grade_asgn_mp.launch &

sleep 5 
xterm -hold -e "rosrun assignment_mp AutoGrade.py"

sleep 2 
#Kill all ros nodes
killall -9 rosmaster


