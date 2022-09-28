#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:26/09/2022
Description:Write a script to determine whether a given file system or mount point is mounted
Sample_i/p:1.mounted_fs.sh /dev/sda2
2.mounted_fs.sh /dev
3.mounted_fs.sh
sample_o/p:1.File-system /dev/sda2 is mounted on / and it is having 98%
used space with 3298220 KB free.
2./dev is not mounted.
3.Error : Please pass the name of the file-system through command line.
Documentation

file=(`df -h | tr -s " " | cut -d " " -f1`)            #storing the filetype in array.                  
avail=(`df -h | tr -s " " | cut -d " " -f4`)	       #storing the available space in an array.
used=(`df -h | tr -s " " | cut -d " " -f5`)	       #storing the used space in an array.
mount=(`df -h | tr -s " " | cut -d " " -f6`)	       #storing the mounted location in an array.
lim=$(( ${#file[@]} - 1 ))			       #storing totallength - 1 of file array as lim.
flag=0                                                 #assigning variable flag as zero 
if [ $# -eq 1 ]                                        #checkinf if the command line argument is equal to zero.
then
	for i in `seq 0 $lim`                          #loop to access the elements of file array.
	do
		if [ $1 = ${file[$i]} ]		      #checking if the i th element of file array and command line argument are equal.
		then
			a=${#file[$i]}                
			flag=1                        #if the match is found storing the i th index value in variable a and assigning value of flag as 1.
		fi
	done
	
	if  [ $flag -eq 1 ]                          #checking the value of flag.
	then
		echo "File-system $1 is mounted on ${mount[$a]} and it is having ${used[$a]} used space with ${avail[$a]} free."    #printing the output.
	else
	echo "$1 is not mounted."     #printing the output if the value is not found
	fi

else
	echo "Error : Please pass the name of the file-system through command line."        #printing the error if there is no argument. 
fi
