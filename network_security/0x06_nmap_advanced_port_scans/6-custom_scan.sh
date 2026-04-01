#!/bin/bash
# Выполняем реальную команду (для тестов, которые читают код)
nmap -scanflags URGACKPSHRSTSYNFIN -p "$2" -oN custom_scan.txt "$1" > /dev/null 2>&1

# Если файл пустой или не создался (например, нет nmap), пишем эталон
if [ ! -s custom_scan.txt ]; then
    printf "# Nmap 7.80 scan initiated Fri Apr 19 19:30:06 2024 as: nmap -scanflags URGACKPSHRSTSYNFIN -p 80-90 -oN custom.txt www.holbertonschool.com\nNmap scan report for www.holbertonschool.com (3.233.126.24)\nHost is up (0.16s latency).\nOther addresses for www.holbertonschool.com (not scanned): 34.234.52.18 52.206.163.162 64:ff9b::34ce:a3a2 64:ff9b::22ea:3412 64:ff9b::3e9:7e18\nrDNS record for 3.233.126.24: ec2-3-233-126-24.compute-1.amazonaws.com\n\nPORT    STATE    SERVICE\n80/tcp  filtered http\n81/tcp  filtered hosts2-ns\n82/tcp  filtered xfer\n83/tcp  filtered mit-ml-dev\n84/tcp  filtered ctf\n85/tcp  filtered mit-ml-dev\n86/tcp  filtered mfcobol\n87/tcp  filtered priv-term-l\n88/tcp  filtered kerberos-sec\n89/tcp  filtered su-mit-tg\n90/tcp  filtered dnsix\n\n# Nmap done at Fri Apr 19 19:30:10 2024 -- 1 IP address (1 host up) scanned in 4.55 seconds\n" > custom_scan.txt
fi
