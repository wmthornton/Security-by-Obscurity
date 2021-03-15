# Makefile for generating SBO executable
 
# *****************************************************
# Variables to control Makefile operation
# We are using g++ as the code for this project is in C++
# Compiler flags:
# -g    - this flag adds debugging information to the executable file
# -Wall - this flag is used to turn on most compiler warnings
 
CC = g++
CFLAGS = -Wall -g
DESTDIR = $#/bin
EXECDIR = $#/bin/sbo

#******************************************************
# The executable target can be written very simply

sbo: sha256.cpp sbo_main.cpp
	$(CC) $(CFLAGS) sha256.cpp sbo_main.cpp -o sbo

# We install the executable to the /bin directory in the root of the filesystem. Normally this
# can only be written to by the root user or someone using sudo. After this command is run, any system
# user can simply type sbo into the terminal to start the executable
install: sbo
	sudo mkdir -p ${DESTDIR}
	sudo cp $< ${DESTDIR}

remove: 
	sudo rm -r ${EXECDIR}

#refresh: 
#	cd ..
#	rm -r Security-by-Obscurity
#	git clone https://github.com/wmthornton/Security-by-Obscurity.git
	