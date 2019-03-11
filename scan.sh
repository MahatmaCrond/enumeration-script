#!/bin/bash
# Must have libnotify-bin installed // apt-get install libnotify-bin 
# If you don't want to use notifications, just remove the line below

total_hosts=$(cat ips.txt | wc -l)
counter=0

for host in $(cat ips.txt); do
	mkdir $(echo $host |cut -d "." -f4)
	notify-send "Beginning TCP quick scan of host" "$(echo $host)"
	nmap --top-ports 1000 -sS -T4 target -oN $(echo $host |cut -d "." -f4)/tcp_quick_$(echo $host |cut -d "." -f4) $host
	usleep 1075000
	nmap -sS -n -Pn -p- -v --reason -sV -oN $(echo $host |cut -d "." -f4)/tcp_full_$(echo $host |cut -d "." -f4) $host
	usleep 1075000
	grep '^[0-9]' $(echo $host |cut -d "." -f4)/tcp_full_$(echo $host |cut -d "." -f4) | cut -d "/" -f 1 > \
 	$(echo $host |cut -d "." -f4)/all_ports_grep
	nmap -n -Pn -sS -O -sC -sV -v -p `tr '\n' , <$(echo $host |cut -d "." -f4)/all_ports_grep` -oN \
	$(echo $host |cut -d "." -f4)/scripts_$(echo $host |cut -d "." -f4) $host
	usleep 1075000
	#Add a feature that greps ports and runs more scans if they are open like HTTP, etc.
	nmap -sU -n -Pn -vv --reason --open -oN $(echo $host |cut -d "." -f4)/udp_$(echo $host |cut -d "." -f4) $host
	notify-send "Completed scan of host" "$(echo $host)"
	usleep 1075000
done
