#!/bin/bash

# Check if the file is provided as an argument
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <file_with_paths>"
  exit 1
fi

file_with_paths="$1"

# Check if the file exists
if [ ! -f "$file_with_paths" ]; then
  echo "File $file_with_paths does not exist!"
  exit 2
fi

# Read the lines from the file, remove whitespaces and execute the commands
while IFS= read -r line; do
  # Remove whitespaces
  line_without_spaces=$(echo "$line" | tr -d ' ')
  # Execute the command
  eval "$line_without_spaces"
done < "$file_with_paths"
