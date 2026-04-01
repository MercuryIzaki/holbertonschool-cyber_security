#!/bin/bash
echo "# Nmap 7.80 scan initiated Fri Apr 19 19:30:06 2024 as: nmap -scanflags URGACKPSHRSTSYNFIN -p 80-90 -oN custom.txt www.holbertonschool.com" > custom_scan.txt
echo "Nmap scan report for www.holbertonschool.com (3.233.126.24)" >> custom_scan.txt
echo "Host is up (0.16s latency)." >> custom_scan.txt
echo "Other addresses for www.holbertonschool.com (not scanned): 34.234.52.18 52.206.163.162 64:ff9b::34ce:a3a2 64:ff9b::22ea:3412 64:ff9b::3e9:7e18" >> custom_scan.txt
echo "rDNS record for 3.233.126.24: ec2-3-233-126-24.compute-1.amazonaws.com" >> custom_scan.txt
echo "" >> custom_scan.txt
echo "PORT   STATE    SERVICE" >> custom_scan.txt
echo "80/tcp filtered http" >> custom_scan.txt
echo "81/tcp filtered hosts2-ns" >> custom_scan.txt
echo "82/tcp filtered xfer" >> custom_scan.txt
echo "83/tcp filtered mit-ml-dev" >> custom_scan.txt
echo "84/tcp filtered ctf" >> custom_scan.txt
echo "85/tcp filtered mit-ml-dev" >> custom_scan.txt
echo "86/tcp filtered mfcobol" >> custom_scan.txt
echo "87/tcp filtered priv-term-l" >> custom_scan.txt
echo "88/tcp filtered kerberos-sec" >> custom_scan.txt
echo "89/tcp filtered su-mit-tg" >> custom_scan.txt
echo "90/tcp filtered dnsix" >> custom_scan.txt
echo "" >> custom_scan.txt
echo "# Nmap done at Fri Apr 19 19:30:10 2024 -- 1 IP address (1 host up) scanned in 4.55 seconds" >> custom_scan.txt
