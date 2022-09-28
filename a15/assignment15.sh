#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:
Description:Shell script to convert string lower to upper and upper to lower
Sample_i/p:1. First case
	      1 – Lower to upper
	      2 – Upper to lower
	      Please select option : 1
	     2. Second case
	      1 – Lower to Upper
	      2 – Upper to Lower
	      Please select option : 2
sample_o/p:1. WHAT IS OS?
		 WHAT ARE THE DIFFERENT OS?
	         WHEN IS OS USED?
	         WHAT IS PARTITION AND ITS USE?
	         HOW MANY PARTITIONS CAN BE DONE?
	      2. what is os?
	         what are the different os?
	         when is os used?
	         what is partition and its use?
	         how many partitions can be done?
	      3. Error: No contents inside the file.
	      4. Error : Please pass the file name through command line.
Documentation

if [ $# -eq 1 ]                                # Checking command line argument equal to one.
then
	if [ -f $1 ]                           # Checking command line argument is a file.
	then
		if [ -s $1 ]                   # Checking command line argument has valid contents.
		then
			echo "1 – Lower to upper"        # Printing the available options.
			echo "2 – Upper to lower"
			read -p "Please select the option:" x   # Reading  the option from user.
			

			case $x in                                # According to the option case will jump to th option.
				1) cat $1 | tr a-z A-Z            # Converting texts to Upper case.
				;;
				2) cat $1 | tr A-Z a-z            # Converting texts to lower case.
				;;
				*) echo "Invalid Option"          # Default case.
				;;
			esac
		else
  		echo "Error: No contents inside the file."        # Display error message if  file is empty.
		fi
	else
	echo "Not a regular file"
	fi
else
echo "Error : Please pass the file name through command line."   # Display error message if command line argument not equal to one.
fi					
