#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:23/09/2022
Description:Write script called say_hello, which will print greetings based on time
Sample_i/p:NIL
sample_o/p:Good Morning user, Have nice day!
This is Thursday 08 in June of 2017 (10:44:10 AM)
Documentation
day=`date | cut -d " " -f1`                        # Storing day in day.
mon=`date | cut -d " " -f3`                        # Storing the current month in mon.
date=`date | cut -d " " -f2`                       # Storing the current date in date.
year=`date | cut -d " " -f5`                       # Storing the current year in year.
time=`date | cut -d " " -f5`                       # Storing current time in time.
h=`date +%H`                                       # Storing hours in hrs

if [ $h -gt 5 -a $h -lt 12 ]                          # If hour is between 5 am to 12 pm this statement executes.                      
then
	echo "Good Morning user, Have nice day!"      # Printing the output.
elif [ $h -gt 12 -a $h -lt 13 ]                       # Checking hour is between 12 pm to 1pm.
then 
	echo "Good noon user ,Have nice day!"         # Printing the output.
elif [ $h -gt 14 -a $h -lt 17 ]                       # Checking hour is between 2pm to 5pm.
then
          echo "Good afternoon user ,Have nice day!"  # Printing the output.
elif [ $h -gt 17 -a $h -lt 21 ]                       # Checking hour is between 5pm to 9pm.
then  
         echo "Good evening user ,Have nice day!"     # Printing the output.
elif [ $h -gt 21 -a $h -lt 5 ]                        # Checking hour is between 9 pm to 5 am
then
         echo "Good night user ,Have nice day!"       # Printing the output.
fi
	echo "This is $day $date in $mon of $year ($time)"     #Printing the output.
