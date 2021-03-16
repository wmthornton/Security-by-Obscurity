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

using namespace std;

int main(int argc, char* argv[])
{
    stdsecurity checkperm;
    checkperm.checkPermissionsSudo();

}