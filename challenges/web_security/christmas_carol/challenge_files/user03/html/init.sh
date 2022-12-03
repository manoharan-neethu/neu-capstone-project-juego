#!/bin/bash

# ctf_flag=$1

echo "............................."
echo "Starting string replacement"
echo "............................."
echo $ctf_flag
echo $PWD

sed -i "s/{hidden_gem}/$ctf_flag/g" /usr/local/apache2/htdocs/secret/info.txt

wordlist=("shockwave" "harmony" "zones" "showpost" "premiere" "playlist" "macadmin" "greybox" "facts" "editpost" "CYBERDOCS" "adminpro")

random_num=`shuf -i 0-10 -n1`

dir_name=${wordlist[$random_num]}

echo $dir_name

mv /usr/local/apache2/htdocs/secret /usr/local/apache2/htdocs/$dir_name
