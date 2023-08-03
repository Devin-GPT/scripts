#!/bin/bash

# Robust ttfonts Deletion Script
# Author: Devin
# Date: August 3, 2023

# This script finds all directories named "ttfonts" within the current directory and its subdirectories
# and deletes them.

set -euo pipefail

function usage() {
    echo "Usage: $0"
    echo "Description: Deletes all directories named 'ttfonts' within the current directory and subdirectories."
}

function delete_ttfonts_directories() {
    local root_dir="$1"

    # Find all directories named 'ttfonts' using 'find' command
    while IFS= read -r -d '' ttfonts_dir; do
        echo "Deleting ttfonts directory: $ttfonts_dir"
        # Use 'rm' command to delete the 'ttfonts' directory
        if ! rm -rf "$ttfonts_dir"; then
            echo "Error: Unable to delete $ttfonts_dir. Please check permissions and try again."
            exit 1
        fi
    done < <(find "$root_dir" -type d -name "ttfonts" -print0)
}

function main() {
    # Check if there are any arguments
    if [ "$#" -ne 0 ]; then
        usage
        exit 1
    fi

    # Get the current working directory
    current_dir=$(pwd)

    echo "Robust ttfonts Deletion Script"
    echo "-----------------------------"
    echo "Current directory: $current_dir"

    # Prompt user for confirmation before deletion
    read -p "Are you sure you want to delete all 'ttfonts' directories? (y/n): " confirmation

    case "$confirmation" in
        [Yy]* )
            delete_ttfonts_directories "$current_dir"
            ;;
        [Nn]* )
            echo "Aborting. No directories were deleted."
            exit 0
            ;;
        * )
            echo "Invalid input. Aborting."
            exit 1
            ;;
    esac
}

main "$@"
