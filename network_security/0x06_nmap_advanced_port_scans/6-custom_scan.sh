#!/bin/bash
TARGET="$1"
PORTS="$2"
nmap -scanflags URGACKPSHRSTSYNFIN -p "$PORTS" -oN custom_scan.txt "$TARGET" > /dev/null 2>&1
