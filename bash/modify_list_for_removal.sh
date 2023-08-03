# This script is used to modify the contents of the file named "answers.txt".
# Specifically, it will add "rm -rf " at the beginning of each line and " &&" at the end of each line,
# except for the last line, which will not have " &&" at the end.

# Check if the file "answers.txt" exists in the current directory.
if [ ! -f answers.txt ]; then
  echo "File answers.txt not found!"
  exit 1
fi

# Make a backup of the original file.
# The command copies the original file to a new file named "answers.txt.backup".
cp answers.txt answers.txt.backup

# Use the 'awk' command to modify the file.
# 'NR > 1 { print last " &&" } { last = $0 }' prints all lines except the last with " &&" added at the end.
# 'END { print "rm -rf " last }' prints the last line without " &&" at the end.
awk 'NR > 1 { print "rm -rf " last " &&" } { last = $0 } END { print "rm -rf " last }' answers.txt > temp.txt && mv temp.txt answers.txt

echo "File answers.txt has been modified. Original file is backed up as answers.txt.backup."s