#!/bin/bash
nmap -sM -vv --reason -p http,https,ftp,ssh,telnet "$1"
