'''
Answers:
	flag:  juegoCTF{Charlie_Brown_76553}
	ASCII: 106 117 101 103 111 67 84 70 123 67 104 97 114 108 105 101 95 66 114 111 119 110 95 55 54 53 53 51 125
	BIN:   01101010 01110101 01100101 01100111 01101111 01000011 01010100 01000110 01111011 01000011 01101000 01100001 01110010 01101100 01101001 01100101 01011111 01000010 01110010 01101111 01110111 01101110 01011111 00110111 00110110 00110101 00110101 00110011 01111101
	HEX:   0x6A 0x75 0x65 0x67 0x6F 0x43 0x54 0x46 0x7B 0x43 0x68 0x61 0x72 0x6C 0x69 0x65 0x5F 0x42 0x72 0x6F 0x77 0x6E 0x5F 0x37 0x36 0x35 0x35 0x33 0x7D
	OCTAL: 0o152 0o165 0o145 0o147 0o157 0o103 0o124 0o106 0o173 0o103 0o150 0o141 0o162 0o154 0o151 0o145 0o137 0o102 0o162 0o157 0o167 0o156 0o137 0o67 0o66 0o65 0o65 0o63 0o175
'''
import socketserver
import time
import sys

class challenge():
	## https://www.duplichecker.com/ascii-to-text.php
	##Converts ascii to text
	def asciiToText(  self ):
		##Controls while loop
		correct = 0
		## user guess varailbe
		flagGuess = ''
		##Correct variable
		flag = 'juegoCTF{Charlie_Brown_76553}'
		## send to user to convert from ascii into the flag
		self.request.sendall( bytes ( "Convert the ASCII into the flag!\n", "utf-8" ) )

		##While correct does not equal 1 continue
		while correct != 1:
			## save the users guess into flagGuess
			flagGuess = self.request.recv(1024).strip()
			flagGuess = flagGuess.decode( "utf-8" )
			##If guess is equal to answer
			if flag == flagGuess:
				##Set correct to 1
				correct = 1
				##Tell user they got it right
				self.request.sendall( bytes ( "You've decoded the flag!\n", "utf-8" ) ) 
			##else if guess is wrong
			else:
				##send to the user that the flag is wrong, format of answer
				self.request.sendall( bytes ( "That is incorrect, format: FLAG{123....}\n", "utf-8" ) )
				##set the flagGuess variable to null
				flagGuess = ''

	##converts from binary to ASCII
	def octalToAscii(  self ):
		## https://www.multiutil.com/ascii-to-octal-converter/
		##correct ot control client right/wrong
		correct = 0
		##user guess variable
		asciiGuess = ''
		##Correct string
		asci = '106 117 101 103 111 67 84 70 123 67 104 97 114 108 105 101 95 66 114 111 119 110 95 55 54 53 53 51 125'
		##Client message from server
		self.request.sendall( bytes ( "Convert the octal into ASCII (Decimal Notation)!\n", "utf-8" ) )
		##while correct doesnt equal 1 continue
		while correct != 1:
			##get user guess in asciiGuess
			asciiGuess = self.request.recv(1024).strip()
			asciiGuess = asciiGuess.decode( "utf-8" )
			## if user guess is right
			if asci == asciiGuess:
				##set correct to 1
				correct = 1
				##send alert to user that it is correct
				self.request.sendall( bytes ( "That is correct!\nNext challenge . . . \n", "utf-8" ) )
				##sleep for 1s
				time.sleep(1)
			##if guess is wrong
			else:
				## send information to client
				self.request.sendall( bytes ( "That is incorrect, format: # ## ### ... Try again!\n", "utf-8"))
				##asciiGuess set to null
				asciiGuess = ''
		#Next function
		challenge.asciiToText( self )

	##Converts the binary strings to hex
	def binToOctal( self ):
		## https://www.multiutil.com/octal-to-binary-converter/
		## First decode challenge
		octal = '0o152 0o165 0o145 0o147 0o157 0o103 0o124 0o106 0o173 0o103 0o150 0o141 0o162 0o154 0o151 0o145 0o137 0o102 0o162 0o157 0o167 0o156 0o137 0o67 0o66 0o65 0o65 0o63 0o175' 
		##correct used to break out of while loop
		correct = 0
		##Stores the guess
		octalGuess = ''
		##Tells user to convert from hex to bin
		self.request.sendall( bytes ( "Convert the binary into octal!\n", "utf-8" ) )

		##while correct does not equal 1
		while correct != 1:
			##Save the client guess into binGuess
			octalGuess = self.request.recv(1024).strip()
			octalGuess = octalGuess.decode( "utf-8" )
			## If guess is equal to answer
			if octal == octalGuess:
				##Change correct to 1
				correct = 1
				##send that the answer is correct
				self.request.sendall( bytes ( "That is correct!\nNext challenge . . .\n", "utf-8" ) )
				##sleep for 1s
				time.sleep(1)
			##If guess is wrong
			else:
				##Send format and incorrect
				self.request.sendall( bytes ( "That is incorrect, format: 0o 0o 0o ... Try again.\n", "utf-8"))
				##sets binGuess to null
				octalGuess = ''
		##sends to next function
		challenge.octalToAscii( self )
		
	##Convert the octal string into hex pass in self obj
	def hexToBin ( self ):
		## https://www.multiutil.com/binary-to-hex-converter/
		##correct used to break out of while loop
		correct = 0
		binary = '01101010 01110101 01100101 01100111 01101111 01000011 01010100 01000110 01111011 01000011 01101000 01100001 01110010 01101100 01101001 01100101 01011111 01000010 01110010 01101111 01110111 01101110 01011111 00110111 00110110 00110101 00110101 00110011 01111101'
		##string to store users guess
		binGuess = ''
		##Proper answer (Remove the 0x?)
		hexi = '0x6A 0x75 0x65 0x67 0x6F 0x43 0x54 0x46 0x7B 0x43 0x68 0x61 0x72 0x6C 0x69 0x65 0x5F 0x42 0x72 0x6F 0x77 0x6E 0x5F 0x37 0x36 0x35 0x35 0x33 0x7D' 
		self.request.sendall( bytes ( "Convert the hex into binary: " + hexi + "\n", "utf-8" ) )
		##while loop to prompt user 
		while correct != 1: 
			##Receive a client side input 
			binGuess = self.request.recv(1024).strip()
			binGuess = binGuess.decode( "utf-8" )
			## If the guess string is equal to the hex string
			if binary == binGuess:
				##set correct to 1
				correct = 1
				##Sends the information to the user
				self.request.sendall( bytes ("That is correct!\nNext challenge...\n", "utf-8") ) 
				##Sleep for 1
				time.sleep ( 1 )
			##was not a correct guess
			else:
				##Send incorrect with format of how to send (could remove 0x**)
				self.request.sendall( bytes ( "That is incorrect, format: 0b 0b 0b ... Try again.\n", "utf-8"))
				##Sets the guess to null again
				binGuess = ''
		##Go to the next function
		challenge.binToOctal( self )

	##Convert the octal string into hex pass in self obj
	def cryptoQuestion02 ( self ):
		print('Testing Crypto Basics..')
		##correct used to break out of while loop
		correct = 0
		binary = '4'
		##string to store users guess
		binGuess = ''
		##Proper answer (Remove the 0x?)
		self.request.sendall( bytes ("All except one is not a property of Hash Function..\n", "utf-8") ) 
		self.request.sendall( bytes ("1. Preimage resistance\n", "utf-8") ) 
		self.request.sendall( bytes ("2. Is a one-way process\n", "utf-8") ) 
		self.request.sendall( bytes ("3. Collision resistance\n", "utf-8") ) 
		self.request.sendall( bytes ("4. Is a type encryption\n", "utf-8") ) 
		##while loop to prompt user 
		while correct != 1: 
			##Receive a client side input 
			binGuess = self.request.recv(1024).strip()
			binGuess = binGuess.decode( "utf-8" )
			## If the guess string is equal to the hex string
			if binary == binGuess:
				##set correct to 1
				correct = 1
				##Sends the information to the user
				self.request.sendall( bytes ("That is correct!\nNext challenge...\n", "utf-8") ) 
				##Sleep for 1
				time.sleep ( 1 )
			##was not a correct guess
			else:
				##Send incorrect with format of how to send (could remove 0x**)
				self.request.sendall( bytes ( "That is incorrect... Try again.\n", "utf-8"))
				##Sets the guess to null again
				binGuess = ''
		##Go to the next function
		challenge.hexToBin( self )

	##Convert the octal string into hex pass in self obj
	def cryptoQuestion01 ( self ):
		print('Testing Crypto Basics..')
		##correct used to break out of while loop
		correct = 0
		binary = '3'
		##string to store users guess
		binGuess = ''
		##Proper answer (Remove the 0x?)
		self.request.sendall( bytes ("Which encryption does TLS use..\n", "utf-8") ) 
		self.request.sendall( bytes ("1. Asymmetric encryption\n", "utf-8") ) 
		self.request.sendall( bytes ("2. Symmetric encryption\n", "utf-8") ) 
		self.request.sendall( bytes ("3. Both\n", "utf-8") ) 
		self.request.sendall( bytes ("4. None\n", "utf-8") ) 
		##while loop to prompt user 
		while correct != 1: 
			##Receive a client side input 
			binGuess = self.request.recv(1024).strip()
			binGuess = binGuess.decode( "utf-8" )
			## If the guess string is equal to the hex string
			if binary == binGuess:
				##set correct to 1
				correct = 1
				##Sends the information to the user
				self.request.sendall( bytes ("That is correct!\nNext challenge...\n", "utf-8") ) 
				##Sleep for 1
				time.sleep ( 1 )
			##was not a correct guess
			else:
				##Send incorrect with format of how to send (could remove 0x**)
				self.request.sendall( bytes ( "That is incorrect... Try again.\n", "utf-8"))
				##Sets the guess to null again
				binGuess = ''
		##Go to the next function
		challenge.cryptoQuestion02( self )

##Allows for passing to the first challenge in the challengers own thread/socket combination.
class TCPSocketHandler( socketserver.BaseRequestHandler ):
	def handle ( self ):
		print('TCP socket handler..')
		challenge.cryptoQuestion01( self )

class SimpleServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
	## Using CTRL+C will kill all threads
	daemon_threads = True
	allow_reuse_address = True
	
	## Takes the server addres, the self obj, and tcp handler and creates a conenction
	def __init__(self, server_address, TCPSocketHandler):
		socketserver.TCPServer.__init__(self, server_address, TCPSocketHandler)

if __name__ == "__main__":

	HOST, PORT = sys.argv[1], int(sys.argv[2])
	##Creates the server for multiple users
	server = SimpleServer((HOST, PORT), TCPSocketHandler)
	try:
		server.serve_forever()
	except KeyboardInterrupt:
		sys.exit(0)

