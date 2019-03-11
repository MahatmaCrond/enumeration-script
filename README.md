# oscp-enumeration-script
Scanner that runs enumeration scripts while you do other things, made for the OSCP exam

## Notes
This script is designed to do Nmap scans of a list of target hosts. It takes an hour or so to complete. To keep you notified of its progress, it 
uses linux system notifications as it finishes each script. 

- Must have libnotify-bin installed // apt-get install libnotify-bin 
- If you don't want to use notifications, just remove the line below
- Before you begin, create a file called ips.txt with a host to scan on each line

## Output organization
It will create a directory structure that consists of just the last portion of the subnet you're scanning. 
For example, if you're scanning 5 hosts in the 192.168.0.1/24 subnet, the directory tree could look like this:

115/
112/
92/
84/
60/

Using the .115 host as an example, each folder will be outputs of each scan:

$ cd 115/
$ ls

all_ports_grep
scripts_73
tcp_full_73
tcp_quick_73
udp_73

## Details

- The script/version scan will only scan the open ports of the host. This may or may not speed up your scan, but I've found that it works faster.
- You can modify this script to take things to the next level, but running a nikto or directory scan for hosts with an open port 80/443 




