#!/bin/bash
# Must have libnotify-bin installed // apt-get install libnotify-bin 
# If you don't want to use notifications, just remove the lines below

total_hosts=$(cat ips.txt | wc -l)
counter=0

for host in $(cat ips.txt); do
	mkdir $(echo $host |cut -d "." -f4)
	counter=$((counter + 1))
	notify-send "Beginning TCP quick scan of host" "$(echo $host) | $counter of $(echo $total_hosts)"
	nmap -T4 -oN $(echo $host |cut -d "." -f4)/tcp_quick_$(echo $host |cut -d "." -f4) $host
	usleep 1075000
	nmap -n -Pn -p- -v --reason -sV -oN $(echo $host |cut -d "." -f4)/tcp_full_$(echo $host |cut -d "." -f4) $host
	usleep 1075000
	nmap -n -Pn -p- -A -v -oN $(echo $host |cut -d "." -f4)/scripts_$(echo $host |cut -d "." -f4) $host
	usleep 1075000
	cat $(echo $host |cut -d "." -f4)/scripts_$(echo $host |cut -d "." -f4) |grep '^[0-9]' |grep open |cut -d" " -f 4- > $(echo $host |cut -d "." -f4)/Versions
	nmap -sU -n -Pn -vv --reason --open -oN $(echo $host |cut -d "." -f4)/udp_$(echo $host |cut -d "." -f4) $host
done
