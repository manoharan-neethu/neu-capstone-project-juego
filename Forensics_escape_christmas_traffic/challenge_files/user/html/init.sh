#!/bin/bash

# ctf_flag=$1

echo "............................."
echo "Starting string replacement"
echo "............................."
echo $ctf_flag
echo $PWD

sed -i "s/hidden_gem/$ctf_flag/g" /usr/local/apache2/htdocs/shark.pcapng
