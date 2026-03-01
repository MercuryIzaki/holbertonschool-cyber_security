#!/bin/bash
DOMAIN=$1
OUTPUT="${DOMAIN}.csv"

whois "$DOMAIN" | awk -F': ' '
BEGIN {
    split("Registrant,Admin,Tech", types, ",");
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext,Fax,Fax Ext,Email", fields, ",");
}
{
    gsub(/^[ \t]+|[ \t]+$/, "", $1);
    gsub(/^[ \t]+|[ \t]+$/, "", $2);
    if (!data[$1]) data[$1] = $2;
}
END {
    for (i=1; i<=3; i++) {
        type = types[i];
        for (j=1; j<=12; j++) {
            field = fields[j];
            key = type " " field;
            val = data[key];
            
            line_key = type " " field;
            if (field ~ /Ext/) line_key = line_key ":";
            if (field == "Street" && val != "") val = val " ";
            
            line = line_key "," val;
            if (full_output == "") full_output = line;
            else full_output = full_output "\n" line;
        }
    }
    printf "%s", full_output;
} ' > "$OUTPUT"
