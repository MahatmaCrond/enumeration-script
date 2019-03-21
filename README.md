# oscp-enumeration-script
Scanner that runs enumeration scripts while you do other things, made for the OSCP exam

## Notes
This script is designed to do Nmap scans of a list of target hosts. It takes an hour or so to complete. To keep you notified of its progress, it 
uses linux system notifications as it finishes each script. 

- Must have libnotify-bin installed // apt-get install libnotify-bin 
- If you don't want to use notifications, just remove the line from the script.
- Before you begin, create a file called ips.txt with a host to scan on each line

## Output organization
It will create a directory structure that consists of just the last portion of the subnet you're scanning. 
For example, if you're scanning 5 hosts in the 10.10.10.1/24 subnet, the directory tree would look like this:

127/
112/
92/
84/
60/

Using the .127 host as an example, each folder will be outputs of each scan:

$ cd 127/

$ ls -la

------------------------

scripts_127

tcp_full_127

tcp_quick_127

udp_127

Versions

![example](https://i.imgur.com/JqnJh6x.png)


## Details

- You can modify this script to take things to the next level, by running a nikto, searchsploit or directory scan for hosts with an open port 80/443.




