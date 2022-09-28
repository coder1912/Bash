#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:
Description:
Sample_i/p:
sample_o/p:
Documentation

function revc()
{
array=($@)
echo "$1"
if [ $# -ne 0 ]
then
	array=(${array[@]:1})
	revc ${array[@]}
fi
}
if [ $# -gt 0 ]
then
revc $@
else
echo "Error : Pass the arguments through command line."
fi
