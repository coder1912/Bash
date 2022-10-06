#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:
Description:
Sample_i/p:
sample_o/p:
Documentation


main()                                                         # Main function of the program.
{
    
    echo -e "**************************************************************************\n*                  __________     Welcome    __________                  *\n*                                                                        *\n**************************************************************************"
    echo -e "1.SignIn\n2.SignUp\n3.Exit"                      # Display the option.
    read -p "Enter your choice:" a                            # Read the user's choice.
    
    case "$a" in                                             # According to the user's choice case will jump to the option.
    1)
        signin                                                # Function call for sign in function.
    ;;
    2)
        signup                                                # Function call for sign up function.
    ;;
    3)
        clear
        exit                                                   #exit option
    ;;
    *)
        echo "INVALID OPTION!!! ENTER THE CORRECT OPTION"     # Default case.
        
        main
    ;;
   esac
   
}

signup()                                         # Function for user sign up.                         
{
    
    read -p "Enter Username:" username           # Reading the username.                                                                
    userdata=(`cat username.csv`)                # Storing the contents of user.csv into an array.                
    flag=0                                       # Assigning the value of flag as zero.
    for i in ${userdata[@]}                      # Depending upon the contents inside userdata the loop wil run.
    do
      if [ $username = $i ]                      # Checking the Username is present in username.csv or not.
      then
        flag=1                                   # If username present, flag is set to 1.
      fi
    done

    if [ $flag -eq 0 ]                           # Checking the flag value is equal to zero.
    then
        passwd                                   # Function call for passwd function.
    else 
        echo "USERNAME ALREADY EXISTS, PLEASE TRY ANOTHER USERNAME!!!"                    # Display error message when the username is already present in username.csv.
        signup                                    # Function call for signup function.
    fi    
}

passwd()                                               # Function for adding user sign up password.
{
    echo -e "\nEnter password:" 
    read -s password1                                  # Reading password in hidden mode.
    echo -e "\nConform password:" 
    read -s password2
    
    if [ ${#password1} -ge 6 ]
    then
        
            if [ $password1 = $password2 ]            # Checking the password1 and passwowd2 is matched or not.
            then
                `echo $username >> username.csv`      # Username will append to user.csv.
                `echo $password2 >> password.csv`     # Password is appended to password.csv
                echo -e "\nSignup Successfull"
                main                                  # Function call for main function.
            else
                echo -e "\nPassword not matching"
                passwd                                # Function call for fuction password.
            fi
    else
        echo -e "\nplease enter atlest 6 characters!!!"         
        passwd                                            # Function call for fuction password if the password characters are less than 6.              
    fi
    
}

 
signin()                                                          # Function used for sign in process.
{
    clear
    read -p "Username:" username                                  # Reading the username.
    userdata=(`cat username.csv`)                                 # Stroring username.csv into an array.
    passworddata=(`cat password.csv`)                             # Storing password.csv into an array.
    length=${#userdata[@]}                                        # Storing the length of array
    flag=0                                                        # Assigning flag equal to zero.



    for i in `seq 0 $(($length-1))`                               # Depending upon the length of array value loop will run.
    do
        if [ ${userdata[$i]} = $username ]                        # Checking the Username is present in user.csv or not.
        then
            flag=1                                                # setting the value of flag as one.
            index=$i                                              # Storing the value of i in index.
        fi
    done
    if [ $flag -eq 1 ]                                            # Checking if the flag is equal to one.
    then
    signinpass()                                                  # Function to check password match to authenticate sign in process
    {
        
        read -s -p "Password: " password1		                  # Reading the password in hidden mode.                            
	    echo                                                      
                                                            
	    if [ $password1 = ${passworddata[$index]} ]		          # Checking the password1 is matching to the specified user.
	    then
		echo -e "\n\YOU HAVE SUCCESSFULLY LOGGED IN."	          # Display the message of successful login.
		login				                                      # Function call for login function.
	    else
		echo -e "YOU HAVE ENTERED THE WRONG PASSWORD,PLEASE RE-ENTER YOUR PASSWORD"	      # Display error message if user entered wrong password.
        fi
		signinpass                                                # Function call for signin password.
    }
    
            signinpass                                            # Function call for signin password.
    else
        echo "USERNAME IS NOT VALID OR REGISTERED.PLEASE CREATE A NEW ACCOUNT TO SIGNIN."               # Display error message if the username is not valid.
        signup
    fi
}

login()                                                                # Function declaration for login.
{
    
    echo -e "**************************************************************************\n*                  __________     TEST    __________                     *\n*                                                                        *\n**************************************************************************"
    echo -e "1.Take test\n2.Back"
    read -p "Enter your choice:" c
   case "$c" in                                                       # According to the user's choice case will jump to the option.
    1)
        taketest                                                      # Function call for write the test.
    ;;
    2)  
        main                                                        # Function call for going back to main function.        
    ;;
    *)                                                               # Default case to exit the program
        echo "INVALID OPTION!!! ENTER THE CORRECT OPTION"                   
        login
    ;;
   esac
   
}

taketest()                                                                 # Function to take the test.
{
    clear
    total_line=`wc -l questionbank.txt |cut -d " " -f1`                    # Storing total number of lines present in questionbank.txt.
    for i in `seq 5 5 $total_line`                                         # Depends upon number of questions available in questionbank.txt loop will run.
    do
        cat questionbank.txt | head -$i | tail -5                          # Displaying the question with option to the user.
        echo
            for i in `seq 9 -1 1`                                          # The loop will run from sequence of 10-1 times to display timer value.
            do
                echo -e -n "\rEnter choice $i: \c"                 
                read -t 1 opt                                              # Reading the answers option from user with timer of 1s refresh time.
                if [ $opt ]                                                # Checking opt has anyvalues.
                then
                    break                                                  # If opt has anyvalue then it will come out of the loop.
                fi
            done
            echo
        if [ -z $opt ]                                                     # Checking the opt string length is equal to zero.
        then
            opt='e'                                                        # Assigning the value for opt is equal to 'e'.
            `echo "$opt" >> useranswer.txt`                                # Appending the value of opt to useranswer.txt

        else
            `echo "$opt" >> useranswer.txt`                                # Appending the value of opt to useranswer.txt
            
        fi
    done
    check                                                                  # Function call for Evaluate the  result.
}

check()                                                            # Function to Evaluate user's test.
{
    userans=(`cat useranswer.txt`)                                 # Storing user's answer into an array.                                                             
    correctans=(`cat correctanswer.txt`)                           # Storing the correct answer to an array.
    length=$((${#correctans[@]} - 1))                              # Storing the length of array
    count=0                                                        # Assigning count is zero.

    for i in `seq 0 $length`                                       #Loop to compare the users anwswer with correct answer.
    do
        if [ ${userans[$i]} = ${correctans[$i]} ]                  # Checking useranswer is correct or not.
        then
            `echo "correctanswer" >> result.txt`                   # If answer is correct "correctanswer" will be appended to result.txt.
            count=$(($count + 1))                                  # Incrementing the value of count.
        elif [ ${userans[$i]} = 'e' ]                              # Checking useranswer is equal to e.
        then
            `echo "timeout" >> result.txt`                         # If useranswer is e "timeout" will be appended to result.txt.
        else
            `echo "wronganswer" >> result.txt`                     # If useranswer is wrong "wronganswer will be appended to result.txt
        fi

    
    done
    resultdisplay                                                  # Function call for display result.

}

resultdisplay()                                                               # Function to display the user's test result.
{
    clear
    echo -e "\n\n*******************************************************\n*                                                     *\n*                  YOUR  RESULT                       *\n*                                                     *\n*******************************************************\n\n"
    total_line=`wc -l questionbank.txt |cut -d " " -f1`                         # Storing total number of line present in questionbank.txt.
    total_mark=`wc -l result.txt | cut -d " " -f1`                              # Storing total number of answers available in result.txt.
    answer=(`cat correctanswer.txt`)                                            # Storing correct answer in array.
    index_num=1                                                                 # Assigning index is 1.
    for i in `seq 5 5 $total_line`                                              # Depends upon number of questions available in questionbank.txt loop will run.
    do
        cat questionbank.txt | head -$i | tail -5                               # Displaying the question with option to the user.
        echo
        res=`sed -n "$index_num p" result.txt`                                  # Storing the user's test results one by one.
    
    if [ $res = "correctanswer" ]                                               
    then
        echo -e "\e[38;5;11m$res \e[0m"                                         # Printing the User's result
    else 

    ## If the answer is wrong.Checking for the correct answer and printing the answer.

        if [ $res = "wronganswer" ]                                             # Comparing the strings are equal or not.
        then
            echo -e "\e[38;5;166m$res"                                          # Printing the User's result  

            if [ "${answer[$(($index_num - 1))]}" = 'a' ]
            then
                echo -e "\e[38;5;166m`cat questionbank.txt | head -$i | tail -4 | sed -n '1p'`\e[0m is the correct answer\n"       
            elif [ "${answer[$(($index_num - 1))]}" = 'b' ]
            then
                echo -e "\e[38;5;166m`cat questionbank.txt | head -$i | tail -4 | sed -n '2p'`\e[0m is the correct answer\n" 
            elif [ "${answer[$(($index_num - 1))]}" = 'c' ]
            then
                echo -e "\e[38;5;166m`cat questionbank.txt | head -$i | tail -4 | sed -n '3p'`\e[0m is the correct answer\n" 
            elif [ "${answer[$(($index_num - 1))]}" = 'd' ]
            then
                echo -e "\e[38;5;166m`cat questionbank.txt | head -$i | tail -4 | sed -n '4p'`\e[0m is the correct answer\n" 
            fi
        fi
    fi   
    index_num=$(( $index_num + 1 ))                                    #incrementing the index number by one.
    done

     echo -e "\nTotal correct answer $count/$total_mark\n"		       #displaying the mark out of total mark.

    
    `rm result.txt;rm useranswer.txt`                                  #removing the result.txt and useranswer.txt files
    exit

} 

main                                                                    #Calling the main function