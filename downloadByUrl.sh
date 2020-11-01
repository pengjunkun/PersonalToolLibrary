####Describle######3
#This is used to download sth from a website use curl
base="https://datasets.simula.no/hsdpa-tcp-logs/"
curl -k $base | grep ">LOGS</a></td>" | cut -d \" -f2 | cut -d "/" -f2 | while read firstLevelName;
do
	#enter the second loop
        mkdir $firstLevelName
        cd $firstLevelName
        echo "now:"$base$firstLevelName
        curl -k $base$firstLevelName"/" | grep --only-matching '>report\..*\.log' |cut -d '>' -f2 | while read i;
           do
				#if you want to parallel below command, please be caution about the downloading direction
                curl -k --remote-name $base$firstLevelName"/"$i
           done
        cd ..
done

