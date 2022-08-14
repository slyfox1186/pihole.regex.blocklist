#!/bin/bash

clear

# Make user input case insensitive
shopt -s nocasematch

# Set directory variable
FILE_DIR="$HOME/pihole.regex"

# Delete: The useless index.html file
if [ -f index.html ]; then
    rm index.html
fi

# Create: $FILE_DIR directory if not exist
if [ -d $FILE_DIR ]; then
    rm -R "$FILE_DIR"
else
    mkdir -p "$FILE_DIR"
fi

# Verify: If files exist move them to $HOME/pihole.regex
SHELL_FILES="exact-blacklist exact-whitelist regex-blacklist regex-whitelist"
FILES=($SHELL_FILES.sh run.sh)

for i in ${FILES[@]}; do
  if [ -f $i ]; then
      mv -f "$i" "$FILE_DIR/$i"
  fi
done

sleep 3
clear

SUB_FILES=($SHELL_FILES)

for i in ${SUB_FILES[@]}; do
    . "$FILE_DIR/$i"
done
