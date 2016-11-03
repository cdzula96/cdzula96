#!/bin/bash

interfacenames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)
ips=(`ifconfig ${interfacenames[0]} | grep 'inet addr' | sed -e 's/  *inet addr://'| sed -e 's/ .*//'` `ifconfig ${interfacenames[1]} | grep 'inet addr' | sed -e 's/  *inet addr://'| sed -e 's/ .*//'`)
gatewayip=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`

read -p "Which interface would you like to check, eth0, lo, or defaultgateway?" choice
case "$choice" in   
    eth0 ) echo "The Interface named ${interfacenames[0]} has the address ${ips[0]}";;
    lo ) echo "The Interface named ${interfacenames[1]} has the address ${ips[1]}";;
    defaultgateway ) echo "The default gateway is set to $gatewayip";;
    * ) echo "Not a valid response, please run again and type exactly as shown in the question";;
esac

if [ "$1" = "--h" ] ; then
  echo "This is the help option"
  exit 0
fi

if [ "$1" = "--route" ] ; then
  echo "The Interface named ${interfacenames[0]} has the address ${ips[0]}"
  echo "The Interface named ${interfacenames[1]} has the address ${ips[1]}"
  echo "The default gateway is set to $gatewayip"
  exit 0
fi

