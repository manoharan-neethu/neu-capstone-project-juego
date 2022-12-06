# Cryptography 1:
### Name : 
You're a Mean One
### Description: 
User is required to find the hidden metadata in the image. Tools like exiftool can provide the list of visible/hiddle metadata added to files. In this specific case the artist metadata is added to the Grinch image and contains the flag in string format.
  
# Cryptography 2:
 
# Database Challenge L1: Better Watch Out
Link to the challenge page is provided in the description of the challenge tile which you will require to find the flag. 
A database and its columns are the topic of the task. You can access it using the credentials listed in the section of the description devoted to users. You will be taken to the target page with three separate databases after providing the requested information. Choose a database using your best judgment if you think it might help you locate the flag. If necessary, you can type SQL commands in the left column. If you carefully read the explanation, you will understand which column contains the flag.
Concept behind the flag: Webservers are hosted on HTTP. Desired data is encrypted using aes_encrypt function and can be decrypted using a base64 encoded passphrase which is provided as a hint.

# Database Challenge L2: Frosty the Snowman 
Link to the challenge page is provided in the description of the challenge tile which you will require to find the flag. 
There are several vulnerabilities in this hosted page and its database that visitors might find and exploit to retrieve certain data. A set of registered credentials that can be used to access the links supplied has already been issued by us. The credentials consist of the following:
•	bob: password
•	Voldemort: horcrux
Use your pentesting skills to gather the data and you will find your flag between one of those vulnerabilities.
Concept behind the flag: Lack of allow list input validation. Allow list validation is appropriate for all input fields provided by the user. Allow list validation involves defining exactly what is authorized. User will require knowledge of SQL injections.

# Forensics L1: Here Comes Santa
You can use the IP address and the port provided in the description of challenge tile to go the dedicated challenge page.
On the redirected page, you will find an image which has the flag. Use your skills to discover the flag from it and complete the challenge. 
Concept behind the flag : Flag is encoded within the metadata of the file to be downloaded. A base64 decoder can be used to obtain the final result.

# Forensics L2: It’s the Most Wonderful Time
You can use the IP address and the port provided in the description of challenge tile to go the dedicated challenge page.
On the redirected page, you will find an image which has the flag. Use your skills to discover the flag from it and complete the challenge. 
Concept behind the flag: The provided image has the flag. The flag is supposed to be found in the web traffic (pcap). Any tools supporting the same such as Wireshark, TextEdit or Sublime can be used to get the final flag.

# Web Challenge L1: Christmas Carol
Concept behind the flag: If the user performs inspect element, he will get a direct hint to perform directory enumeration. By using tools like dirsearch or gobuster etc., the hidden directory can be found. After redirecting to the hidden directory, info.txt folder contains the flag.

# Web Challenge L2: Holiday Cookies
Concept behind the flag: The user will be prompted to give an input message and image path. The “image path” input is made vulnerable which can steal the base 64 encoded cookie by injecting XSS attack code. The decoded cookie will generate the required flag.



# Miscellaneous Challenge: Snowflake
Concept behind the flag: This is a file-based challenge, and a python file needs to be downloaded. The flag is encoded inside the code. After analyzing and reverse thinking the code, the user can see that a function call is missing. The user can also find the hints: “Oops! I misplaced the Christmas tree” and “Maybe you need to call the Christmas tree.” After the appropriate function call, the flag will be shown in the output CLI.


