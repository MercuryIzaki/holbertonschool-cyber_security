#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

nmap -sN -p 20-25 "$1"
