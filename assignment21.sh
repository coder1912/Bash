#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:27/09/2022
Description:Write a script to replace 20% lines in a C file randomly and replace it with the pattern
Sample_i/p:1. ./replace_DEL.sh main.c
Before replacing
#incude <stdio.h>
int main()
{
         printf(“Hello world\n”);
}
2. ./replace_DEL.sh main1.c
3. ./replace_DEL.sh main2.c
4. ./replace_DEL.sh
sample_o/p:After replacing
#incude <stdio.h>
int main()
{
<-----------Deleted------------>
}

Documentation
if [ $# -eq 1 ]
then
    if [ -f $1 ]
    then
        if [ -s $1 ]
        then    
            total=`cat $1 | wc -l`
	    if [ $total -ge 5 ]

	    then
	    	echo "Before Replacing"
		cat $1
		t=`echo "$total * (20/100)" | bc`
		for i in $t
		do
			var=`shuf -i 1-$total -n1`
			sed -i "$var s/.*/-------Deleted-------/" $1
		done
		echo "After Replacing"
		cat $1
	   fi
	else
		echo "Error : main2.c is empty file. So can’t replace the string."
	fi
    else
    	echo "Error : No such a file."     
    fi
else
	echo "Error : Please pass the file name through command line."
fi
