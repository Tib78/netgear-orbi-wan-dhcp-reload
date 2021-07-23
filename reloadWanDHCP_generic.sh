#!/bin/bash

USER=
PASSWORD=
FTI=fti%2F

#Capture random hash of Netgear WEBUI
HASH=$(wget -qO- --user $USER --password $PASSWORD http://192.168.0.1/BAS_orange_dhcp.htm | grep "ether.cgi?id=.*" | sed 's/^.*id=\([0-9a-z]*\).*$/\1/')

echo "Current session id : $HASH"

echo 'Send WAN DHCP POST request'
wget --post-data "apply=Appliquer&login_type=Orange+France+DHCP&system_name=$FTI&WANAssign=dhcp&DNSAssign=0&MACAssign=0&runtest=no&wan_proto=dhcp&wan_dns_sel=0&wan_hwaddr_sel=0&lan_ipaddr=192.168.0.1&lan_netmask=255.255.255.0&parental_control=0&parental_control_circle=0&ipv6_proto=disable&wan_aggr=0&orange_isp=1&orange_auth_id=90%3A$FTI&orange_tv_enabled=0&orange_wan_type=dhcp" \
  -qO- --user $USER --password $PASSWORD \
  http://192.168.0.1/ether.cgi?id=$HASH > /dev/null

echo "WAN DHCP adresses updated successfully"

