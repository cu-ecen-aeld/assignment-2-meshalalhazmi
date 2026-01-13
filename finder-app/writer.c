#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>  
#include <syslog.h>
int main(int argc, char *argv[]) {
    // Check for correct number of arguments
    if (argc < 2) {
        syslog(LOG_ERR, "Usage: %s <writefile> <writestr>", argv[0]);
        // fprintf(stderr, "Usage: %s <writefile> <writestr>\n", argv[0]);
        return 1;
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    //TODO check if directory   exists, if not return error
     
  
    // append content to file    
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Could not create file %s: %s", writefile, strerror(errno));
        // fprintf(stderr, "Error: Could not create file %s: %s\n", writefile, strerror(errno));
        return 1;
    }

    fprintf(file, "%s", writestr);
    syslog(LOG_DEBUG, "write string '%s' to file %s", writestr, writefile);
    fclose(file);

    return 0;
}