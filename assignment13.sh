#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:23/09/2022
Description:Display the longest and shortest user-names on the system
Sample_i/p:NIL
sample_o/p:The Longest Name is: speech-dispatcher
	   The Shortest Name is:lp
Documentation
arr=(`cut -d : -f1 /etc/passwd`)                       # Storing the username in array.
limit=${#arr[@]}                                       # Storing the length of array.
s=${#arr[0]}                                           # Storing first value of array in a variable.
l=${#arr[0]}                                           # Storing first value of array in a variable.

for i in `seq 0 $(( $limit - 1 ))`                     # The loop will run until the  array elements are empty.
do 
        if [ ${#arr[i]} -gt $l ]                       # Checking length of i value is greater than length of l. 
        then
        l=${#arr[i]}                                  
	largest=${arr[i]}                                  # Storing longest username in largest.
        elif [ ${#arr[i]} -lt $s ]                     # Checking length of i value is less than length of s.
        then
        s=${#arr[i]}
	smallest=${arr[i]}                                  # Storing smallest username smalest.

        fi
done

echo -n "Largest number is $largest"                     # Printing the output.
echo
echo -n "Smallest number is $smallest"
echo
