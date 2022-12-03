#!/bin/bash

echo "............................."
echo "Starting ciphertext creation"
echo "............................."
echo $ctf_flag
echo $PWD

python -c "import codecs; import sys; print(codecs.encode(sys.argv[1],'rot_13'))" "$ctf_flag" >> /usr/local/apache2/htdocs/ciphertext.txt
