#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:21/09/2022
Description:Script to rename a file/directory replaced by lower/upper case letters
Sample_i/p:./file_upper_lower.sh
sample_o/p:Files are rename in lowercase and directories are renamed in upper case
Documentation



for k in `ls`      			#Loop to access the files and directories 
do
	if [ -f $k ]                    #checking whether it is a file 
	then
	v=`echo "$k" | tr A-Z a-z`      #translating the files to lowercase
	elif [ -d $k ] 			#Checking whether it is directory
	then
        v=`echo "$k" | tr a-z A-Z`	#translating the directories to uppercase
	fi
mv $k $v                                #Renaming the files to lowercase and directories to uppercase 
done
