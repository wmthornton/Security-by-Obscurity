#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include "sha256.h" // FIPS 180-2 SHA-224/256/384/512 Implementation
#include "cout.h" // COUT.h contains all of our standardized, static program output
#include "permissions.h" // PERMISSIONS.h contains all of our security routines

using namespace std;

void stdmessage::printHeader(){

    system("clear"); // Clear the terminal screen before continuing. Not the best as 'system' can be a security hole, but
                     // we are using it nonetheless because we prefer a clear terminal for program execution

    cout << "Security-by-Obscurity (sbo) Copyright (C) 2021 Wayne Thornton\n";
    cout << "This program comes with ABSOLUTELY NO WARRANTY; for details type\n"; 
    cout << "`show w'. This is free software, and you are welcome to redistribute\n"; 
    cout << "it under certain conditions; type `show c' for details.\n";
    cout << "\n";

}

void stdmessage::requestInput(){

    cout << "SBO:> ";
}

void stdmessage::permissionErrorNotRoot(){

    cout << "This application cannot be run without sudo or root permissions!\n";
}

void stdmessage::permissionError(){

    cout << "You do not have permission to perform this action!\n";
}

void stdmessage::tmpDeletionSuccess(){

    cout << "\n";
    cout << "Deletion of temporary files completed successfully!\n";
}

void stdmessage::gnuWarranty(){

    cout << "The GNU General Public License v3 included with the source code specifies\n";
    cout << "warranty disclaimers in Sections 15 and 16. Please refer to that document.\n";
}

void stdmessage::gnuDistribution(){

    cout << "The GNU General Public License v3 included with the source code specifies\n";
    cout << "your redistribution rights. Please refer to that document.\n";

}