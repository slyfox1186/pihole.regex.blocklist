#!/bin/bash

clear

# Change working directory to "$HOME/pihole.regex"
cd "$HOME/pihole.regex"

# Make user input case insensitive
shopt -s nocasematch

# Get the user's input
echo -e "\\n[RegEx Blacklist] filters: [A]dd [R]emove [E]xit"
read a
clear
if [[ $a == "A" ]]; then
    /usr/bin/curl -sSl 'https://raw.githubusercontent.com/slyfox1186/pihole.regex/main/scripts/python-install/regex-blacklist.py' | sudo python3
    echo '[i] The regex blacklist filters have been added.'
elif [[ $a == "R" ]]; then
    /usr/bin/curl -sSl 'https://raw.githubusercontent.com/slyfox1186/pihole.regex/main/scripts/python-uninstall/regex-blacklist.py' | sudo python3
    echo '[i] The regex blacklist filters were removed.'
elif [[ $a == "E" ]]; then
    exit 1
fi

echo -e "\\n"
read -p '[i] Press enter to continue.'
clear
