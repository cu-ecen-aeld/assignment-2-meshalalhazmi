#!/bin/sh
# Finder script for assignment 1 and assignment 2

#Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ $# -lt 2 ]
then
    echo "Usage: $0 <directory-to-search> <string-to-search>"
    exit 1
fi
 
filesdir=$1

searchstr=$2
    echo "filesdir: ${filesdir} searchstr: ${searchstr}"
 

#Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

if [ ! -d "$filesdir" ]
then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

#Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).

numfiles=$(find "$filesdir" -type f | wc -l)
numlines=$(grep -r "$searchstr" "$filesdir" | wc -l)
echo "The number of files are ${numfiles} and the number of matching lines are ${numlines}"
exit 0
# End of finder.sh  
