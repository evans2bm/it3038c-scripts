#!/bin/bash
#This script will email us our user, IP, hostname and today's date
emailaddress=bengevans97@gmail.com
today=$(date +" %m-%d-%Y")
ip=$(ip a | grep ' dynamic ens192' | awk ' {print $2}')
content="User: $USER \t\t\t\t Date:  $today \t\t\t\t Bash Version:  $BASH_VERSION \t\t\t\t Machine Type:  $MACHTYPE"
mail -s "IT3038C 192.168.33.132" $emailaddress <<< $(echo -e $content)
