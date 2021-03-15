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

#******************************************************
# The executable target can be written very simply

sbo: sha256.cpp POC_Working.cpp
	$(CC) $(CFLAGS) sha256.cpp POC_Working.cpp -o sbo

# We are install the executable to the /bin directory in the root of the filesystem. Normally this
# can only be written to by the root user or someone using sudo. After this command is run, any system
# user can simply type sbo into the terminal to start the executable
install: sbo
	sudo mkdir -p ${DESTDIR}
	sudo cp $< ${DESTDIR}