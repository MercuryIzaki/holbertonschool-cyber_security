#!/bin/bash
nmap -vv -sM --reason -p ftp,ssh,telnet,http,https "$1"
