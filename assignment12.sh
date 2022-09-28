#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:20/09/2022
Description:Script to print contents of file from given line number to next given number of lines.
Sample_i/p:
1. ./print_lines.sh 5 3 myfile.txt
2. ./print_lines.sh myfile.txt
3. ./print_lines.sh 5 10 myfile.txt
sample_o/p:
1.line number 5
  line number 6
  line number 7
2.Error: arguments missing!
3.Error: data.txt is having only 10 lines. file should have atleast 14 lines
Documentation

if [ -f $3 ]                                     #Checking whether it is a valid file. 
then
	if [ -s $3 ]                             #Checking whether the file has any contents.
	then
		if [ $# -eq 3 ]			# Checking command line argument is equal to three.
		then
			t=`cat $3 | wc -l`	# Counting number of lines present in the file.
			m=$((($1+$2)-1))
				
				if [ $t -gt $m ]         # Checking total number of lines is greater than the minimum number of line.
				then 
					echo "`head -$((($1+$2)-1)) $3 | tail -$2`"         # Print contents of file from given line number to next given number of lines.
				else 
					echo "Error: $3 is having only $t lines. file should have atleast $((($1+$2)-1)) lines"              # Dispaly error message, if the total number of lines is less than that of minimum number of line in the file.
				fi	  
		else
			echo "Error: arguments missing!
Usage: ./file_filter.sh start_line upto_line filename
For eg. ./file_filter.sh 5 5 <file>"	 	#Display error message,If the command line argument is not qual to three.

		fi			
        else
		echo "No context in file"                  #Display error message if there is no context in file.
	fi
else 
	echo"Not a regular file."                          #Display error message if the file is not a regular file
fi		
	
	

 

