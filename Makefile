#
# This file is part of the SBO distribution (https://github.com/wmthornton/Security-by-Obscurity).
# Copyright (c) 2021 Wayne Michael Thornton aka DextersLaboratory2020.
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

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
TMPDIR  = $#/bin/.SBO
OUTDIR  = $#/bin/.SBO_OUT

# These variables are linked to the Applications directory of the macOS filesystem.
MACDESTDIR = /opt/local/bin
MACEXECDIR = /opt/local/bin/sbo-mac
MACEXEC = /opt/local/bin/sbo-mac
MACTMPDIR = /opt/local/bin/.SBO
MACOUTDIR = /opt/local/bin/.SBO_OUT

#******************************************************
# We run make all to compile both Linux and macOS versions

all: linux mac
#******************************************************
# The executable target can be written very simply

linux: sha256.h sha256.cpp permissions.h permissions.cpp cin.h stdinput.cpp cout.h stdoutput.cpp encrypt.h encrypt.cpp sbo_main_ref.cpp
	$(CC) $(CFLAGS) sha256.cpp stdoutput.cpp permissions.cpp stdinput.cpp encrypt.cpp sbo_main_ref.cpp -o sbo

#******************************************************
# The Macintosh executable target can be written very simply as well

mac: sha256.h sha256.cpp permissions.h permissions.cpp cin.h stdinput-mac.cpp cout.h stdoutput.cpp encrypt.h encrypt-mac.cpp sbo_main_ref.cpp
	$(CC) $(CFLAGS) sha256.cpp stdoutput.cpp permissions.cpp stdinput-mac.cpp encrypt-mac.cpp sbo_main_ref.cpp -o sbo-mac

# We install the executable to the /bin directory in the root of the filesystem. Normally this
# can only be written to by the root user or someone using sudo. After this command is run, any system
# user can simply type sbo into the terminal to start the executable as it will be in the user's $PATH
install: linux
	sudo mkdir -p ${DESTDIR}
	sudo cp sbo ${DESTDIR}
	sudo mkdir -p ${TMPDIR}
	sudo mkdir -p ${OUTDIR}
	sudo install -g 0 -o 0 -m 0644 sbo-util.1 /usr/local/man/man8/
	sudo gzip /usr/local/man/man8/sbo-util.1

remove: 
	sudo rm sbo
	sudo rm -r ${EXECDIR}
	sudo rm -r ${TMPDIR}
	sudo rm -r ${OUTDIR}
	sudo rm /usr/local/man/man8/sbo-util.1.gz

clean:
	sudo rm sbo
	sudo rm -r ${TMPDIR}
	sudo rm -r ${OUTDIR}
	sudo mkdir -p ${TMPDIR}
	sudo mkdir -p ${OUTDIR}

# Installing the executable to the opt/local/bin folder on macOS systems is a little more tricky.
install-mac: mac
	sudo mkdir -p ${MACDESTDIR}
	sudo cp sbo-mac ${MACDESTDIR}
	sudo mkdir -p ${MACTMPDIR}
	sudo mkdir -p ${MACOUTDIR}
	sudo chmod +x ${MACEXEC}
	sudo install -g 0 -o 0 -m 0644 sbo-util.1 /usr/local/share/man/man1
	sudo gzip /usr/local/share/man/man1/sbo-util.1

remove-mac:
	sudo rm sbo-mac
	sudo rm -r ${MACEXECDIR}
	sudo rm -r ${MACTMPDIR}
	sudo rm -r ${MACOUTDIR}
	sudo rm /usr/local/share/man/man1/sbo-util.1.gz

clean-mac:
	sudo rm sbo-mac
	sudo rm -r ${MACTMPDIR}
	sudo rm -r ${MACOUTDIR}
	sudo mkdir -p ${MACTMPDIR}
	sudo mkdir -p ${MACOUTDIR}
	