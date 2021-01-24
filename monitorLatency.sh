#!/bin/bash

mkdir ./monitorResults
cd ./monitorResults

#this function is used to monitor one specific IP
#-t is used to specify the monitoring time
#will ping with different payload by -s
#this will save the monitoring results in ./ip/payload
function monitorOneIP(){
	for ((payload=0;payload<1473;payload+=50))
	do
		date > ./$1/$payload.txt
		ping -i 1 -t 5 -s $payload $1 >> ./$1/$payload.txt &
	done
}

ips=("www.qq.com" "163.204.241.227" "www.faceplusplus.com.cn" "github.com")

function monitorAllOneHour(){
	for ip in ${ips[@]}
	do
		mkdir ./$ip
		monitorOneIP $ip
	done
}

for hour in {0..23}
do
	mkdir "hour$hour"
	cd "hour$hour"
	monitorAllOneHour
	cd ..
done



