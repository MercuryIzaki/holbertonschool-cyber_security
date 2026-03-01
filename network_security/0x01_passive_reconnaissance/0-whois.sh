#!/bin/bash
DOMAIN=$1
OUTPUT="${DOMAIN}.csv"

whois "$DOMAIN" | awk -F': ' '
BEGIN {
    # Список полей в нужном порядке
    split("Registrant,Admin,Tech", types, ",");
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext,Fax,Fax Ext,Email", fields, ",");
}
{
    # Очищаем лишние пробелы в начале и конце
    gsub(/^[ \t]+|[ \t]+$/, "", $1);
    gsub(/^[ \t]+|[ \t]+$/, "", $2);
    
    # Собираем данные в массив
    data[$1] = $2;
}
END {
    for (i=1; i<=3; i++) {
        type = types[i];
        for (j=1; j<=12; j++) {
            field = fields[j];
            key = type " " field;
            val = data[key];
            
            # Формируем заголовок строки
            line_key = type " " field;
            
            # Специфическая логика для "Ext"
            if (field ~ /Ext/) {
                line_key = line_key ":";
            }
            
            # Специфическая логика для "Street" (добавляем пробел в конец)
            if (field == "Street") {
                val = val " ";
            }
            
            # Формируем финальную строку
            line = line_key "," val;
            
            # Собираем всё в одну переменную, чтобы потом вывести без последней новой строки
            if (full_output == "") {
                full_output = line;
            } else {
                full_output = full_output "\n" line;
            }
        }
    }
    printf "%s", full_output;
} ' > "$OUTPUT"
