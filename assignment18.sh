#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:21/09/2022
Description:Script to print contents of a directory without ls command
Sample_i/p:
1. ./output_ls.sh /home/user/ECEP/Linux_Systems
2. ./output_ls.sh ~ ~/ECEP
3. ./ouput_ls.sh Test
sample_o/p:
1. Assignments Classwork
2. /home/user:
Downloads Documents Desktop Music Pictures Public Videos
/home/user/ECEP:
Linux_Systems Advnc_C Linux_Internals Data_Structures 
3. output_ls.sh: Cannot access ‘Test’ : No such a file or directory.
Documentation

if [ $# -gt 0 ]                      # Checking command line argument is greater than zero.
then
        arr=($@)                     #Storing command line argument in an array.
        l=${#arr[@]}                 #Finding length of an array and storing it in a variable.

        for i in `seq 0 $(($l - 1))`  #for loop for accessing the elements in array it will run upto the value of l-1 
        do
                if [ -d ${arr[i]} ]   #checking if the array element is a directory or not
                then

                        cd ${arr[i]}  # Moving to the directory path.
                        echo "`pwd` :"  #Printing current working directory.
                        echo *          # Printing files and directories in current working directory
                else
                        echo "$0: Cannot access ‘$1’ : No such a file or directory."      # Displaying error message.
                fi

        done
else
        echo "`pwd`:"   #printing the current working directory if no aruments are passed
        echo *          #Printing files and directories in current working directory
fi

