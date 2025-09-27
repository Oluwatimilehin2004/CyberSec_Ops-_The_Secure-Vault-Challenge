#!/bin/bash

# Check vault exists
if [[ ! -d "$HOME/secure_vault" ]]; then
    echo "Error: secure_vault doesn't exist!"
    exit 1
fi

#list current file permissions
cd $HOME/secure_vault
echo "Current file permissions:"
ls -l

# Function to update a single file
update_file_permission() {
    file=$1
    default_perm=$2

    echo ""
    echo "File: $file"
    ls -l "$file"

    read -p "Do you want to update permission for $file? (Yes/No, Press enter for default permission $default_perm): " choice

    if [[ $choice = "Yes" || $choice = "yes" ]]; then
        read -p "Enter new permission (e.g., 600, 644, 755): " newperm
        chmod $newperm "$file"
        echo "Updated $file to $newperm"
    elif [[ -z $choice ]]; then
        chmod $default_perm "$file"
        echo "No input → applied default $default_perm to $file"
    else
        echo "Invalid permission. Skipped $file"
    fi
}

# Apply function to each file individually
update_file_permission keys.txt 600
update_file_permission secrets.txt 640
update_file_permission logs.txt 644

# Display final permissions
echo ""
echo "Final file permissions:"
ls -l
