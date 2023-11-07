#!/bin/bash

# Define the output file
output_file="/var/log/logged_in_users.log"

# Function to check and log logged-in users
log_logged_in_users() {
    echo "Timestamp: $(date)" >> "$output_file"
    who | awk '{print "User:", $1, "IP:", $5}' | sort | uniq >> "$output_file"
}

# Initialize the output file with a header
echo "Logged-in users by IP:" > "$output_file"

while true; do
    clear
    log_logged_in_users
    cat "$output_file"
    sleep 10
done
