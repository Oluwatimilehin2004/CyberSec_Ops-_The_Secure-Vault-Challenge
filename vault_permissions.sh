#! /bin/bash
vault_dir="$HOME/secure_vault"
if [ ! -d "$vault_dir" ]; then
echo " Error: secure_vault directory not found"
exit 1
fi
update_permission() {
 file_name=$1
    default_perm=$2
    file_path="$vault_dir/$file_name"

    echo ""
    echo " Checking $file_name..."
    ls -l "$file_path"

    echo -n "Do you want to update permissions for $file_name? (yes/no): "
    read answer

    if [ "$answer" = "yes" ]; then
        echo -n "Enter new permission (e.g., 600): "
        read new_perm
        chmod "$new_perm" "$file_path"
        echo " Updated $file_name to $new_perm"
    elif [ -z "$answer" ]; then
        chmod "$default_perm" "$file_path"
        echo "No input detected. Applied default permission $default_perm to $file_name"
    else
        echo " Keeping existing permissions for $file_name"
    fi
}
# Apply permission logic to each file
update_permission "keys.txt" 600
update_permission "secrets.txt" 640
update_permission "logs.txt" 644
