#!bin/bash
m="$( cd "$( dirname "$0" )" && pwd )"

echo "--- Hardware ---" > $m/task4_1.out
CPU=`cat /proc/cpuinfo | grep "model name"|sed 's/model name	:/ /' | uniq `
echo "CPU: $CPU" >> $m/task4_1.out
RAM=`cat /proc/meminfo | grep "MemTotal" | sed 's/MemTotal:       / /'`
echo "RAM: $RAM">> $m/task4_1.out
Manufacturer=`sudo dmidecode -s baseboard-manufacturer`
Productname=` sudo dmidecode -s baseboard-product-name`
if [[ -z $Manufacturer ]]; then Manufacturer=""; fi
if [[ -z $Productname ]]; then Productname=Unknown; fi

echo "Motherboard: $Manufacturer $Productname ">> $m/task4_1.out
Serialnumber=`sudo dmidecode -s system-serial-number`
if [[ -z $Serialnumber ]]; then Serialnumber=Unknown; fi
echo "System Serial Number: $Serialnumber">> $m/task4_1.out
echo "---System---'">> $m/task4_1.out
PRETTYNAME=` lsb_release -d | awk '{print $2 ,$3 ,$4}'`
echo "OS Description: $PRETTYNAME" >>$m/task4_1.out
Kernelversion=` uname -r `
echo "Kernel version: $Kernelversion">> $m/task4_1.out
Installationdate=`tune2fs -l /dev/sda1 | grep created |awk '{print $3,$4,$5,$6,$7}'`
echo "Installation date: $Installationdate">> $m/task4_1.out
Hostname=`hostname `
echo "Hostname: $Hostname">> $m/task4_1.out
Uptime=`uptime -p | awk '{print $2,$3,$4,$5,$6,$7}'`
echo "Uptime: $Uptime">> $m/task4_1.out
Processesrunning=` ps aux | wc -l`
echo "Processes running: $Processesrunning">> $m/task4_1.out
Userslogged=`who | wc -l`
echo "Users logged in: $Userslogged ">> $m/task4_1.out
echo "--- Network ---">> $m/task4_1.out
#Network=`ip addr list| grep -w "inet"|awk '{print $1 " : " $2}'`
#network_address=`ip -br a | awk '{print $1 " : " $3}' | set 's//-/'`

network_address=`ip -br a | awk '{  if (-n "$3" ) print $1,$3; else print $1, "-" }'`
echo "$network_address">> $m/task4_1.out
