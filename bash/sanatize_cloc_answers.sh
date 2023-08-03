#!/bin/bash

# Author: Devin
# Date: August 3, 2023

# This script is used to modify the contents of the file named "answers.txt".
# Specifically, it will remove the colon (:) and everything that follows it on each line.

# Check if the file "answers.txt" exists in the current directory.
if [ ! -f answers.txt ]; then
  echo "File answers.txt not found!"
  exit 1
fi

# Make a backup of the original file.
# The command copies the original file to a new file named "answers.txt.backup".
cp answers.txt answers.txt.backup

# Use the 'sed' command to modify the file in place.
# The '-i' option with an empty string argument '' tells 'sed' to edit the file in place without creating a backup.
# The 's/:.*//' part of the command is a regular expression that matches a colon and everything after it on a line,
# and then replaces that matched text with nothing (i.e., deletes it).
sed -i '' 's/:.*//' answers.txt

echo "File answers.txt has been modified. Original file is backed up as answers.txt.backup."
