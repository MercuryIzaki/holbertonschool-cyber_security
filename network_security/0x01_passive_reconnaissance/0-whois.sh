#!/bin/bash
whois "$1" | awk -F': +' 'BEGIN{split("Registrant,Admin,Tech",t,",");split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext,Fax,Fax Ext,Email",f,",")}{gsub(/\r/,"");a[$1]=$2}END{for(i=1;i<=3;i++)for(j=1;j<=12;j++){k=t[i]" "f[j];v=a[k];k1=k;if(f[j]~/Ext/)k1=k1":";printf "%s,%s%s%s",k1,(v==""?"":" "),v,(i==3&&j==12?"":"\n")}}' > "$1.csv"
