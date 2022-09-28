#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:26/09/2022
Description:For each directory in the $PATH, display the number of executable files in that directory
Sample_i/p:./executable_path.sh
sample_o/p:Current dir: /usr/local/sbin
current count: 0
Current dir: /usr/local/bin
current count: 0
Current dir: /usr/sbin
current count: 205
Current dir: /usr/bin
current count: 1889
Current dir: /sbin
current count: 187
Current dir: /bin
current count: 159
Current dir: /usr/games
current count: 5
Current dir: /usr/local/games
current count: 0
Total – 2445
Documentation

arr=(`echo $PATH | tr ":" " "`)                                  # Storing path variables into array.
total=0                                                          # Storing  total equal to zero.
for i in ${arr[@]}                                               # Loop will run until the array element is empty.
do 
	cd $i                                                    # Opening the directories in i value.
	count=0                                                  # Setting count as zero.
		for j in `ls`                                    # ls is considered as list and it takes the value of list one by one using loop.
		do
			if [ -x $j ]                             # Checking excutable files are available in the current directory.
			then
				count=$(( $count + 1 ))          # Incrementing the value of count.
			fi
		done
	total=$(( $total + $count ))                             # Adding total + count. 
	echo "Current dir: $i"                                   # Printing current directory.
	echo "current count: $count"                             # Printing value in count.
done
echo "Total - $total"                                            # Printing total. 
