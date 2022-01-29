#! /bin/bash
# Searches all subdirectories of specified path variable
# for all expressions in sussyExpressionsArray.

# will search all subdirectories of the path
# you put here
path=/
# use / for the whole system, $(pwd) for current directory

# Example: sussyExpressionsArray=("passwd.*root" "ssh")
# use regex characters like for ones that don't need to
# match: . for one char, .* for any # of chars.
sussyExpressionsArray=("passwd.*root" "ssh.*-R" "ssh.*localhost")

# Expands array into string and strips whitespace
sussyExpressionsString=$(printf %s "${sussyExpressionsArray[@]/%/|}" $'\n')

# Removes last | from string, otherwise it will grab
# every file on the disk (big oof)
cleanString=$(echo $sussyExpressionsString | sed 's/.$//')

# does the searching
echo "Searching for the following values:$cleanString."
grep -rwE $cleanString $path >> sussyFiles.txt
echo "Finished."

exit 0