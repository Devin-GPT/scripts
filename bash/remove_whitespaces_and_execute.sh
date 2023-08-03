#!/bin/bash

# Author: Devin
# Date: August 3, 2023

if [ $# -ne 1 ]; then
  echo "Usage: $0 <file_path_list>"
  exit 1
fi

input_file="$1"

if [ ! -f "$input_file" ]; then
  echo "Error: Input file not found."
  exit 1
fi

while IFS= read -r file_path; do
  # Replace spaces with escape sequences
  formatted_path=${file_path// /\\ }
  echo "$formatted_path"
done < "$input_file"
