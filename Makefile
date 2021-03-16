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
TMPDIR  = $#/root/Desktop/.SBO
CLEAN_STATUS  = "Filesystem is clean. tmp directory has been regenerated"

# These variables are linked to the Applications directory of the macOS filesystem.
MACDESTDIR = /opt/local/bin
MACEXECDIR = /opt/local/bin/sbo-mac
MACEXEC = /opt/local/bin/sbo-mac

#******************************************************
# We run make all to compile both Linux and macOS versions

all: linux mac
#******************************************************
# The executable target can be written very simply

linux: sha256.h sha256.cpp permissions.h permissions.cpp cin.h stdinput.cpp cout.h stdoutput.cpp encrypt.h encrypt.cpp sbo_main_ref.cpp
	$(CC) $(CFLAGS) sha256.cpp stdoutput.cpp permissions.cpp stdinput.cpp encrypt.cpp sbo_main_ref.cpp -o sbo

#******************************************************
# The Macintosh executable target can be written very simply as well

mac: sha256.h sha256.cpp permissions.h permissions.cpp cin.h stdinput.cpp cout.h stdoutput.cpp encrypt.h encrypt.cpp sbo_main_ref.cpp
	$(CC) $(CFLAGS) sha256.cpp stdoutput.cpp permissions.cpp stdinput.cpp encrypt.cpp sbo_main_ref.cpp -o sbo-mac

# We install the executable to the /bin directory in the root of the filesystem. Normally this
# can only be written to by the root user or someone using sudo. After this command is run, any system
# user can simply type sbo into the terminal to start the executable as it will be in the user's $PATH
install: linux
	sudo mkdir -p ${DESTDIR}
	sudo cp sbo ${DESTDIR}
	sudo mkdir -p ${TMPDIR}

remove: 
	sudo rm sbo
	sudo rm -r ${EXECDIR}
	sudo rm -r ${TMPDIR}

clean:
	sudo rm sbo
	sudo rm -r ${TMPDIR}
	sudo mkdir -p ${TMPDIR}
	echo ${CLEAN_STATUS}

# Installing the executable to the opt/local/bin folder on macOS systems is a little more tricky.
install-mac: mac
	sudo mkdir -p ${MACDESTDIR}
	sudo cp sbo-mac ${MACDESTDIR}
	sudo chmod +x ${MACEXEC}

	

remove-mac:
	sudo rm -r ${MACEXECDIR}

	