#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "sha256.h" // FIPS 180-2 SHA-224/256/384/512 Implementation
#include "cout.h" // COUT.h contains all of our standardized, static program output
#include "permissions.h" // PERMISSIONS.h contains all of our security routines
#include "cin.h" // CIN.h contains the code to store input variables for processing

using namespace std;

void stdsecurity::checkPermissionsSudo(){

    // Check for root or sudo permissions on launch. If user is not root or sudo show error
    if(geteuid() != 0) {

        stdmessage error;
        error.permissionErrorNotRoot();
        
        return;

    } else {

        // If user is root or sudo, show program header and input prompt
        // There might be a better way to do this without making spaghetti code...
        stdmessage header;
        header.printHeader();

        stdinput main;
        main.processInputandCommands();

    }
}

void stdsecurity::deleteTmp(){

    // Delete contents of tmp.sbo file created in sudo or root home directory during program execution
    std::string deletetmp = "";
    std::string roothomedir = getenv("HOME");
    std::ofstream tmp (roothomedir + "/Desktop/.SBO/tmp.sbo");
    tmp << deletetmp;
    tmp.close();

    stdmessage deleted;
    deleted.tmpDeletionSuccess();
    
}