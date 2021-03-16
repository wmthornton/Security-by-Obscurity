#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "sha256.h" // FIPS 180-2 SHA-224/256/384/512 Implementation
#include "cout.h" // COUT.h contains all of our standardized, static program output
#include "permissions.h" // PERMISSIONS.h contains all of our security routines
#include "cin.h" // CIN.h contains the code to store input variables for processing
#include "encrypt.h" // ENCRYPT.h contains the input-output-confusion-diffusion method used during processing

using namespace std;

void stdinput::processInputandCommands(){

    stdmessage request;
    request.requestInput();

    // Store input string into memory
    string input_string;
    getline(cin, input_string);

    // Run a quick if-else loop to check for program commands referenced in header - process accordingly
    if(input_string == "show w"){

        stdmessage warranty;
        warranty.gnuWarranty();

    } else if(input_string == "show c") {

        stdmessage redistribution;
        redistribution.gnuDistribution();

    } else {

        // Break out of the if-else loop and begin processing input_string thru input-confusion-diffusion
        // paradigm

        // Determine the path to the sudo or root home user directory and save input_string to tmp file
        std::ofstream tmp ("/opt/local/bin/.SBO/tmp.sbo");
        tmp << input_string;
        tmp.close();

        // Open encryption process
        stdencrypt encrypt;
        encrypt.processInputNERD();
    }
    
}