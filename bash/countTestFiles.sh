#!/bin/bash

# Path to the directory you want to search
directory_path="$1"

# Check if the directory exists
if [[ ! -d "$directory_path" ]]; then
  echo "Directory does not exist!"
  exit 1
fi

# Count total .ex files (all Elixir source files)
total_files=$(find "$directory_path" -type f -name '*.ex' | wc -l)

# Count total .exs files in the test directory (all Elixir test files)
test_files=$(find "$directory_path" -type f -path '*/test/*' -name '*.exs' | wc -l)

# Calculate percentage
if [[ $total_files -eq 0 ]]; then
  echo "No Elixir source files found!"
else
  percentage=$(echo "scale=2; ($test_files / $total_files) * 100" | bc)
  echo "Total Elixir source files: $total_files"
  echo "Total Elixir test files: $test_files"
  echo "Percentage of tests: $percentage%"
fi
