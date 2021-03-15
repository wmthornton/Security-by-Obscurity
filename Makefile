# Makefile for generating SBO executable
 
# *****************************************************
# Variables to control Makefile operation
# We are using g++ as the code for this project is in C++
# Compiler flags:
# -g    - this flag adds debugging information to the executable file
# -Wall - this flag is used to turn on most compiler warnings
 
CC = g++
CFLAGS = -Wall -g

# These variables are linked to the Linux root filesystem
DESTDIR = $#/bin
EXECDIR = $#/bin/sbo

# These variables are linked to the /usr/bin directory of the macOS filesystem. This is already in
# the default user path for macOS users
MACDESTDIR = /usr/bin
MACEXECDIR = /usr/bin/sbo-mac

#******************************************************
# We run make all to compile both Linux and macOS versions

all: linux mac
#******************************************************
# The executable target can be written very simply

linux: sha256.h sha256.cpp sbo_main.cpp
	$(CC) $(CFLAGS) sha256.cpp sbo_main.cpp -o sbo

#******************************************************
# The Macintosh executable target can be written very simply as well

mac: sha256.h sha256.cpp sbo_main.cpp
	$(CC) $(CFLAGS) sha256.cpp sbo_main.cpp -o sbo-mac

# We install the executable to the /bin directory in the root of the filesystem. Normally this
# can only be written to by the root user or someone using sudo. After this command is run, any system
# user can simply type sbo into the terminal to start the executable as it will be in the user's $PATH
install: sbo
	sudo mkdir -p ${DESTDIR}
	sudo cp sbo ${DESTDIR}

remove: 
	sudo rm -r ${EXECDIR}

# Installing the executable on macOS systems is a little more tricky.
install-mac: mac
	sudo mkdir -p ${MACDESTDIR}
	sudo cp sbo-mac ${MACDESTDIR}
	sudo chmod +x ${MACEXECDIR}

remove-mac:
	sudo rm -r ${MACEXECDIR}

	