#!/bin/bash

# Chandler 200327666

# If the user needs help
function usage {
    echo "Usage: $0 [he | --help] to find a specific port, please enter the name of either eth0, lo, defaultgateway, or none"
}

if [ "$0" = "--he" ] ; then
  echo "This is the help option"
  exit 0
fi

interfacenames=(`ifconfig | grep '^[a-zA-Z]'| awk '{print $1}'`)
ips=(`ifconfig ${interfacenames[0]} | grep 'inet addr' | sed -e 's/  *inet addr://'| sed -e 's/ .*//'` `ifconfig ${interfacenames[1]} | grep 'inet addr' | sed -e 's/  *inet addr://'| sed -e 's/ .*//'`)
gatewayip=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`

while [ $# -gt 0 ]; do
    case "$1" in
-he | --help )
        usage
        exit 0
        ;;
        
-r | --route )
        echo "The default gateway is set to $gatewayip"
        ;;
    esac
  shift
done

read -p "Which interface would you like to check, eth0, lo, defaultgateway, none?" choice
case "$choice" in   
    eth0 ) echo "The Interface named ${interfacenames[0]} has the address ${ips[0]}";;
    lo ) echo "The Interface named ${interfacenames[1]} has the address ${ips[1]}";;
    defaultgateway ) echo "The default gateway is set to $gatewayip";;
    none ) echo "Your wish is my command";;
    * ) echo "Not a valid response, please run again and type exactly as shown in the question";;
esac

read -p "Would you like to view the default route information as well? ( yes or no )" choice1
case "$choice1" in
    yes | YES | y | Yes ) echo "The default gateway is set to $gatewayip";;
    no | NO | n | No ) echo "Ok that was easy, thank you"
esac
