#!/bin/bash  

let grade=0

echo "Testing 1-link robot"
python3 grader.py --num_links 1 --time_step 0.01 --friction 0.2

if [ $? -eq 0 ]
then
    let grade=$grade+4
    echo "+4 points"
fi

echo "Testing 2-link robot"
python3 grader.py --num_links 2 --time_step 0.01 --friction 0.4

if [ $? -eq 0 ]
then
    let grade=$grade+3
    echo "+3 points"
fi

echo "Testing 3-link robot"
python3 grader.py --num_links 3 --time_step 0.01 --friction 0.6

if [ $? -eq 0 ]
then
    let grade=$grade+3
    echo "+3 points"
fi

echo "Final grade:"
echo $grade

