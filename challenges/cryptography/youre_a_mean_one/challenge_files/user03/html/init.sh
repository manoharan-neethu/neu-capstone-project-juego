#!/bin/bash

# ctf_flag=$1

echo "............................."
echo "Starting exiftool"
echo "............................."
echo $ctf_flag
echo $PWD

exiftool -artist=$ctf_flag /usr/local/apache2/htdocs/Grinch.png
exiftool -delete_original! /usr/local/apache2/htdocs/

# sed -i "s/neethu/$ctf_flag/g" /usr/local/apache2/htdocs/Grinch.png


exec "$@"

