#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:23/09/2022
Description:Count the number of users with user IDs between given range.
Sample_i/p:
1. ./user_ids.sh
2. ./user_ids.sh 0 100
3. ./user_ids.sh 100
4. ./user_ids.sh 200 100
sample_o/p:
1. Total count of user ID between 500 to 10000 is: 2
2. Total count of user ID between 0 to 100 is : 3
3. Error : Please pass 2 arguments through CL.
	         Usage : ./user_ids.sh 100 200
4. Error : Invalid range. Please enter the valid range through CL. 
Documentation

arr=(`cut -d : -f3 /etc/passwd`)
count=0
if [ $# -eq 0 ]
then
	for i in `seq 0 $(( ${#arr[@]} - 1 ))`
	do
		if [ ${arr[$i]} -ge 500 -a ${arr[$i]} -le 10000 ]
		then
			count=$(( $count + 1))
		fi
	done
	echo "Total count of user ID between 500 to 10000 is: $count"

elif [ $# -eq 2 ]
then

	if [ $1 -lt $2 ]
	then 
		for i in `seq 0 $(( ${#arr[@]} - 1 ))`
		do
			if [ ${arr[$i]} -ge $1 -a ${arr[$i]} -le $2 ]
			then
				count=$(( $count + 1 ))
			fi
		done
		echo "Total count of user ID between $1 to $2 is : $count"
	else
	echo "Error : Invalid range. Please enter the valid range through CL."
        fi
else
echo "Error : Please pass 2 arguments through CL.\nUsage : ./user_ids.sh 100 200"
fi				
