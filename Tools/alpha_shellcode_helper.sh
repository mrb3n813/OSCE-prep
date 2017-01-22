#!/bin/bash

function pastethis() {

echo "Ok, now you can either enter all this noise into Olly if that's your jam or just proceed to generate your shellcode"
printf "\n"
echo "AND EAX, <VALUE>"
echo "AND EAX, <VALUE>"
echo "SUB EAX,$firststring"
echo "SUB EAX,$secondstring"
echo "SUB EAX,$thirdstring"
echo "SUB EAX,$fourthstring"
echo "SUB EAX,$fifthstring"
echo "SUB EAX,$sixthstring"
echo "PUSH EAX"
}


function formatter() {


printf "\n"
echo "This next part can be used to generate and format your encoded egghunter shellcode."
echo "Note, make sure to paste in the AND values in this format: 0x554E4D4A"
printf "\n"
read -r -p "Enter first AND value: "  Firstand
line1=$(echo "$Firstand" | sed  's/\(.\)\(.\)/\2\1/g' | rev | sed -r 's/[^ ]+/\\x25&/g' | tr -d ' '|  sed 's/../&\\x/g;s/+$//' | sed 's/^.\{3\}//' | sed 's/.\{6\}$//' | sed 's/\(.*\)/"\1"/g' | sed 's/^\(.\{1\}\)/\1\\/')
echo "$line1"

printf "\n"
read -r -p "Enter second AND value: " Secondand
line2=$(echo "$Secondand" | sed 's/\(.\)\(.\)/\2\1/g' | rev | sed -r 's/[^ ]+/\\x25&/g' | tr -d ' '|  sed 's/../&\\x/g;s/+$//' | sed 's/^.\{3\}//' | sed 's/.\{6\}$//' | sed 's/\(.*\)/"\1"/g' | sed 's/^\(.\{1\}\)/\1\\/')
echo "$line2"

printf "\n"
line3=$(echo "$firststring" | sed 's/\(.\)\(.\)/\2\1/g' | rev | sed -r 's/[^ ]+/\\x2D&/g' | tr -d ' '|  sed 's/../&\\x/g;s/+$//' | sed 's/^.\{3\}//' | sed 's/.\{6\}$//' | sed 's/\(.*\)/"\1"/g' | sed 's/^\(.\{1\}\)/\1\\/')
echo "$line3"

printf "\n"
line4=$(echo "$secondstring" | sed 's/\(.\)\(.\)/\2\1/g' | rev | sed -r 's/[^ ]+/\\x2D&/g' | tr -d ' '|  sed 's/../&\\x/g;s/+$//' | sed 's/^.\{3\}//' | sed 's/.\{6\}$//' | sed 's/\(.*\)/"\1"/g' | sed 's/^\(.\{1\}\)/\1\\/')
echo "$line4"

printf "\n"
line5=$(echo "$thirdstring" | sed 's/\(.\)\(.\)/\2\1/g' | rev | sed -r 's/[^ ]+/\\x2D&/g' | tr -d ' '|  sed 's/../&\\x/g;s/+$//' | sed 's/^.\{3\}//' | sed 's/.\{6\}$//' | sed 's/\(.*\)/"\1"/g' | sed 's/^\(.\{1\}\)/\1\\/')
echo "$line5"

printf "\n"
line6=$(echo "$fourthstring" | sed 's/\(.\)\(.\)/\2\1/g' | rev | sed -r 's/[^ ]+/\\x2D&/g' | tr -d ' '|  sed 's/../&\\x/g;s/+$//' | sed 's/^.\{3\}//' | sed 's/.\{6\}$//' | sed 's/\(.*\)/"\1"/g' | sed 's/^\(.\{1\}\)/\1\\/')
echo "$line6"

printf "\n"
line7=$(echo "$fifthstring" | sed 's/\(.\)\(.\)/\2\1/g' | rev | sed -r 's/[^ ]+/\\x2D&/g' | tr -d ' '|  sed 's/../&\\x/g;s/+$//' | sed 's/^.\{3\}//' | sed 's/.\{6\}$//' | sed 's/\(.*\)/"\1"/g' | sed 's/^\(.\{1\}\)/\1\\/')
echo "$line7"

printf "\n"
line8=$(echo "$sixthstring" | sed 's/\(.\)\(.\)/\2\1/g' | rev | sed -r 's/[^ ]+/\\x2D&/g' | tr -d ' '|  sed 's/../&\\x/g;s/+$//' | sed 's/^.\{3\}//' | sed 's/.\{6\}$//' | sed 's/\(.*\)/"\1"/g' | sed 's/^\(.\{1\}\)/\1\\/')
echo "$line8"

printf "\n"
echo "Paste this formatted shellcode into your exploit, but remove any blank lines if you had less subtractions: "
printf "\n"
echo "$line1"
echo "$line2"
echo "$line3"
echo "$line4"
echo "$line5"
echo "$line6"
echo "$line7"
echo "$line8"
echo \"\X50\"


}


function calcshellcode() {

printf "\n"
echo "## Script to aid in the calculations needed for writing alphanumeric shellcode ##"
echo "##                  Author: Ben Rollin                                         ##"
echo "##                  Change log: January 21, 2017 - Initial version             ##"
printf "\n"

printf "\n"

read -r -p "Enter first string: " firststring

calc1=`echo print /x 0x0 - $firststring | gdb | sed 's/.*=//' | sed -e'1,9d' | sed -e'2,2d'`

printf "\n"
echo "$calc1"
printf "\n"

read -r -p "Does the result contain bad characters? [y/n]" response1
printf "\n"

if [[ "$response1" = n ]]; then

	echo "Great!"
	printf "\n"
	pastethis
	formatter
	exit 0

elif [[ "$response1" = y ]]; then

read -r -p "Enter amount to subtract: " secondstring
printf "\n"

calc2=`echo print /x $calc1 - $secondstring | gdb | sed 's/.*=//' | sed -e'1,9d' | sed -e'2,2d'`

printf "\n"
echo "$calc2"
printf "\n"


read -r -p "Does the result still contain bad characters? [y/n]" response2

fi

printf "\n"

if [[ "$response2" = n ]]; then

        echo "Great!"
        printf "\n" 
        pastethis
	formatter
	exit 0

elif [[ "$response2" = y ]]; then

read -r -p "Enter amount to subtract: " thirdstring

calc3=`echo print /x $calc2 - $secondstring | gdb | sed 's/.*=//' | sed -e'1,9d' | sed -e'2,2d'`

printf "\n"
echo "$calc3"
printf "\n"

read -r -p "Does the result still contain bad characters? [y/n]" response3
printf "\n"

fi

printf "\n"

if [[ "$response3" = n ]]; then

        echo "Great!"
        printf "\n" 
        pastethis
	formatter
	exit 0

elif [[ "$response3" = y ]]; then

read -r -p "Enter amount to subtract: " thirdstring

calc4=`echo print /x $calc3 - $thirdstring | gdb | sed 's/.*=//' | sed -e'1,9d' | sed -e'2,2d'`

printf "\n"
echo "$calc4"
printf "\n"


#fi

read -r -p "Does the result still contain bad characters? [y/n]" response4
printf "\n"

fi

printf "\n"

if [[ "$response4" = n ]]; then

        echo "Great!"
        printf "\n" 
        pastethis
	formatter
	exit 0

elif [[ "$response4" = y ]]; then

read -r -p "Enter amount to subtract: " fourthstring

calc5=`echo print /x $calc4 - $fourthstring | gdb | sed 's/.*=//' | sed -e'1,9d' | sed -e'2,2d'`

printf "\n"
echo "$calc5"
printf "\n"

#fi

read -r -p "Does the result still contain bad characters? [y/n]" response5
printf "\n"

fi


printf "\n"

if [[ "$response5" = n ]]; then

        echo "Great!"
        printf "\n" 
        pastethis
	formatter
	exit 0

elif [[ "$response5" = y ]]; then

read -r -p "Enter amount to subtract: " fifthstring

calc6=`echo print /x $calc5 - $fifthstring | gdb | sed 's/.*=//' | sed -e'1,9d' | sed -e'2,2d'`

printf "\n"
echo "$calc6"
printf "\n"

#fi

read -r -p "Does the result still contain bad characters? [y/n]" response6
printf "\n"

fi

printf "\n"

if [[ "$response6" = n ]]; then

        echo "Great!"
        printf "\n" 
        pastethis
	formatter
	exit 0

elif [[ "$response5" = y ]]; then

read -r -p "Enter amount to subtract: " sixthstring

calc7=`echo print /x $calc6 - $sixthstring | gdb | sed 's/.*=//' | sed -e'1,9d' | sed -e'2,2d'`

printf "\n"
echo "$calc7"
printf "\n"


printf "\n"


fi

}

function formatbinarypaste() {

printf "\n"
echo "## Simple bash script to convert string copied from Olly to hex ## "
printf "\n"

read -r -p "Paste in binary copy string: " bcopy
printf "\n"

echo  $bcopy | sed -r 's/[^ ]+/\\x&/g' | tr -d ' ' |  sed -e "s/.\{20\}/&\n/g" |  sed 's/\\x50/\n&/g' | sed 's/\(.*\)/"\1"/g'


}


main_menu () {
clear
echo "Cracking the Perimeter and OSCE Helper Script"
printf "\n"
echo "Select an option from the following"
printf "\n"
    options=(
        "Calculate alphanumeric shellcode"
        "Format a binary copy for your exploit"
	"You mad?"
        "Quit"
    )
    select option in "${options[@]}"; do
        case $option in
            ${options[0]})
                calcshellcode
                break
            ;;
            ${options[1]})
                formatbinarypaste
                break
            ;;
            ${options[2]})
               echo '

        __
     __/o \_
     \____  \
         /   \
   __   //\   \
__/o \-//--\   \_/
\____  ___  \  |
     ||   \ |\ |
    _||   _||_||'

printf "\n"
                break
             ;;
            ${options[3]})
		echo "Now you've done it..."
                exit
             ;;
            *) 
                echo invalid option
            ;;
        esac
    done
}
main_menu
