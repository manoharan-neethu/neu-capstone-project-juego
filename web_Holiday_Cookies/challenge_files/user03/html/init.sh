#!/bin/bash

# ctf_flag=$1

echo "............................."
echo "Starting string replacement"
echo "............................."
echo $ctf_flag
echo $PWD

encode=`echo $ctf_flag | base64`

sed -i "s/{hidden_gem}/$encode/g" /usr/local/apache2/htdocs/app.js
