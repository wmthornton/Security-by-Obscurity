# Security-by-Obscurity

An advanced password generator written in C++ and designed to run within the terminal emulator of any *NIX compatible system. It is based on the work by Nintendo(r) European Reasearch and Development (NERD) and the "HireMe" challenge. I've taken the work of NERD a step further and used the input-confusion-diffusion paradigm in conjunction with SHA/256 encryption to generate randomized passwords that cannot be decoded (yet - quantum computers will change this eventually!) The software generates sufficiently random passwords to allow the same plaintext password to be used multiple times without generating the same output. There's probably no real reason to be developing this, but I wanted to use the NERD code in a new way and practice my C++ skills at the same time. 

Right now, the code is designed to run as "sudo" because I want to expand the code to allow the user to choose random files containing hexadecimal integers from their filesystems and to have that code stored in the root of the filesystem. I'm sure the hardcore *NIX admins and users will be screaming at this, but it's how I designed the code -- if you don't like that, you're able to change it; that's the beauty of open-source software!

I should note that in order to compile, you will need "g++" and "make" installed on your system. The command to compile successfully is: "make install". Running this command will compile the executable, and then, using sudo or root permissions, install the executable to your /bin directory. 

To remove the application, simply run "make remove" which will use sudo or root permissions to delete the sbo executable from the /bin directory.

This program is cross-platform. If you have a macOS machine, the dependencies are the same. Use "make install-mac" and "make remove-mac". You executable will be named "sbo-mac" and will be stored in the /opt/local/bin directory. EDIT: CROSS PLATFORM IS NOT CURRENTLY WORKING DUE TO IMPLEMENTATION OF TMP FILE IN ROOT FILESYSTEM ON LINUX. 

MAKEFILE CHEATSHEET:

make all: Compiles executables for Linux and macOS and stores them in the source directory.

make linux: Compiles linux executable and stores in source directory.

make mac: Compiles macOS executable and stores in source directory.

make install: Compiles linux executable and installs to /bin directory. Also creates tmp directory.

make remove: Removes linux executable and tmp directory from system.

make clean: Removes linux executable from source directory and regenerates tmp directory. Does not remove executable from /bin directory.

make install-mac: Compiles macOS executable and installs to /opt/local/bin directory. Also creates tmp directory. (NOT CURRENTLY WORKING)

make remove-mac: Removes macOS executable and tmp directory from system. (NOT CURRENTLY WORKING)

make clean-mac: Removes macOS executable from source directory and regenerates tmp directory. Does not remove executable from /opt/local/bin directory. (NOT CURRENTLY WORKING)