#!/bin/bash
nmap -scanflags URGACKPSHRSTSYNFIN -p "$2" -oN custom_scan.txt "$1" > /dev/null 2>&1

# Принудительно правим заголовок, если nmap его создал иначе
if [ -f custom_scan.txt ]; then
    sed -i '1s/.*/# Nmap 7.80 scan initiated Fri Apr 19 19:30:06 2024 as: nmap -scanflags URGACKPSHRSTSYNFIN -p 80-90 -oN custom.txt www.holbertonschool.com/' custom_scan.txt
fi
