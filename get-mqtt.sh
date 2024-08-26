#!/bin/bash

PRINTER_IP="YOUR_IP_ADDRESS"
PRINTER_PASSWD="YOUR_PRINTER_PASSWORD"

if [ ! -r blcert.pem ]
then
    openssl s_client -showcerts -connect ${PRINTER_IP}:8883 </dev/null | sed -n -e '/-.BEGIN/,/-.END/ p' > blcert.pem
fi

# mosquitto_sub -h ${PRINTER_IP} -p 8883 --cafile ./blcert.pem --insecure -u bblp -P ${PRINTER_PASSWD} -t "#"

mosquitto_sub -h ${PRINTER_IP} -p 8883 --cafile ./blcert.pem --insecure -u bblp -P ${PRINTER_PASSWD} -t "#" | jq -r '
  .print.ams.ams[0].humidity as $humidity |
  ("humidity: " +
  (if $humidity == "5" then "1"
   elif $humidity == "4" then "2"
   elif $humidity == "3" then "3"
   elif $humidity == "2" then "4"
   elif $humidity == "1" then "5"
   else "Unknown value"
   end
  ))
'
