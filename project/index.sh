#!/bin/bash
<<Documentation
Name:Akhil Ajith K C
Date:
Description:
Sample_i/p:
sample_o/p:
Documentation


main()
{
    
    echo -e "**************************************************************************\n*                  __________     Welcome    __________                  *\n*                                                                        *\n**************************************************************************"
    echo -e "1.SignIn\n2.SignUp\n3.Exit"
    read -p "Enter your choice:" a
    
    case "$a" in
    1)
        signin
    ;;
    2)
        signup
    ;;
    3)
        clear
        exit
    ;;
    *)
        echo "INVALID OPTION!!! ENTER THE CORRECT OPTION"
        
        main
    ;;
   esac
   
}

signup()
{
    
    read -p "Enter Username:" username
    userdata=(`cat username.csv`)
    flag=0
    for i in ${userdata[@]} 
    do
      if [ $username = $i ]
      then
        flag=1
      fi
    done

    if [ $flag -eq 0 ]
    then
        passwd
    else 
        echo "USERNAME ALREADY EXISTS, PLEASE TRY ANOTHER USERNAME!!!"
        signup
    fi    
}

passwd()
{
    echo -e "\nEnter password:" 
    read -s password1
    echo -e "\nConform password:" 
    read -s password2
    
    if [ ${#password1} -ge 6 ]
    then
        
            if [ $password1 = $password2 ] 
            then
                `echo $username >> username.csv`
                `echo $password2 >> password.csv`
                echo -e "\nSignup Successfull"
                main
            else
                echo -e "\nPassword not matching"
                passwd
            fi
    else
        echo -e "\nplease enter atlest 6 characters!!!"
        passwd
    fi
    
}

 
signin()
{
    clear
    read -p "Username:" username
    userdata=(`cat username.csv`)
    passworddata=(`cat password.csv`)
    length=${#userdata[@]}
    flag=0
    for i in `seq 0 $(($length-1))`
    do
        if [ ${userdata[$i]} = $username ]
        then
            flag=1
            index=$i
        fi
    done
    if [ $flag -eq 1 ]
    then
    signinpass()
    {
        
        read -s -p "Password: " password1		
	    echo

	    if [ $password1 = ${passworddata[$index]} ]		
	    then
		echo -e "\n\YOU HAVE SUCCESSFULLY LOGGED IN."	
		login				
	    else
		echo -e "YOU HAVE ENTERED THE WRONG PASSWORD,PLEASE RE-ENTER YOUR PASSWORD"	
        fi
		signinpass
    }
    
            signinpass
    else
        echo "USERNAME IS NOT VALID OR REGISTERED.PLEASE CREATE A NEW ACCOUNT TO SIGNIN."
        signup
    fi
}

login()
{
    
    echo -e "**************************************************************************\n*                  __________     TEST    __________                     *\n*                                                                        *\n**************************************************************************"
    echo -e "1.Take test\n2.Back"
    read -p "Enter your choice:" c
   case "$c" in
    1)
        taketest       
    ;;
    2)
        main
    ;;
    *) 
        echo "INVALID OPTION!!! ENTER THE CORRECT OPTION"
        login
    ;;
   esac
   
}

taketest()
{
    clear
    total_line=`wc -l questionbank.txt |cut -d " " -f1`
    for i in `seq 5 5 $total_line`
    do
        cat questionbank.txt | head -$i | tail -5
        echo
            for i in `seq 9 -1 1`
            do
                echo -e -n "\rEnter choice $i: \c"
                read -t 1 opt
                if [ $opt ]
                then
                    break
                fi
            done
            echo
        if [ -z $opt ] 
        then
            opt='e'
            `echo "$opt" >> useranswer.txt`

        else
            `echo "$opt" >> useranswer.txt`
            
        fi
    done
    check
}

check()
{
    userans=(`cat useranswer.txt`)
    correctans=(`cat correctanswer.txt`)
    length=$((${#correctans[@]} - 1))
    count=0
    for i in `seq 0 $length` 
    do
        if [ ${userans[$i]} = ${correctans[$i]} ]
        then
            `echo "correctanswer" >> result.txt`
            count=$(($count + 1))
        elif [ ${userans[$i]} = 'e' ]
        then
            `echo "timeout" >> result.txt`
        else
            `echo "wronganswer" >> result.txt`
        fi

    
    done
    resultdisplay

}

resultdisplay()
{
    clear
    echo -e "\n\n*******************************************************\n*                                                     *\n*                  YOUR  RESULT                       *\n*                                                     *\n*******************************************************\n\n"
    total_line=`wc -l questionbank.txt |cut -d " " -f1`
    total_mark=`wc -l result.txt | cut -d " " -f1`
    answer=(`cat correctanswer.txt`)
    num=1
    for i in `seq 5 5 $total_line`
    do
        cat questionbank.txt | head -$i | tail -5
        echo
        res=`sed -n "$num p" result.txt`
    
    if [ $res = "correctanswer" ]    
    then
        echo -e "\e[38;5;11m$res \e[0m"
    else 

        if [ $res = "wronganswer" ]
        then
            echo -e "\e[38;5;166m$res"

            if [ "${answer[$(($num - 1))]}" = 'a' ]
            then
                echo -e "\e[38;5;166m`cat questionbank.txt | head -$i | tail -4 | sed -n '1p'`\e[0m is the correct answer\n" 
            elif [ "${answer[$(($num - 1))]}" = 'b' ]
            then
                echo -e "\e[38;5;166m`cat questionbank.txt | head -$i | tail -4 | sed -n '2p'`\e[0m is the correct answer\n" 
            elif [ "${answer[$(($num - 1))]}" = 'c' ]
            then
                echo -e "\e[38;5;166m`cat questionbank.txt | head -$i | tail -4 | sed -n '3p'`\e[0m is the correct answer\n" 
            elif [ "${answer[$(($num - 1))]}" = 'd' ]
            then
                echo -e "\e[38;5;166m`cat questionbank.txt | head -$i | tail -4 | sed -n '4p'`\e[0m is the correct answer\n" 
            fi
        fi
    fi   
    num=$(( $num + 1 ))
    done

     echo -e "\nTotal correct answer $count/$total_mark\n"		

    
    `rm result.txt;rm useranswer.txt`
    exit

} 

main