# iptables_log
Simple scripts to log a packet in most of iptables/ebtables chains, by inserting a rule with a LOG target.

Usage:

./iptables_log.sh <iptables rules>

./iptables_unlog.sh <iptables rules>

./ebtables_log.sh <ebtables rules>

./ebtables_unlog.sh <ebtables rules>

For example, turn on the log:

./iptables_log.sh -d 192.168.0.100 -p tcp -m tcp --dport 80

(You may check the iptables rules with the command 'iptables -L -n'.) 

Turn off the log:

./iptables_unlog.sh -d 192.168.0.100 -p tcp -m tcp --dport 80
