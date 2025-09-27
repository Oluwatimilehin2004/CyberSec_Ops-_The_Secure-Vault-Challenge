#!/bin/bash
VAULT_DIR="$HOME/secure_vault"
REPORT_FILE="$VAULT_DIR/vault_report.txt"

> "$REPORT_FILE"
for file in "$VAULT_DIR"/*; do
    if [[ -f $file ]]; then
        # 1.a File name
        filename=$(basename "$file")
        echo "File: $filename"
        echo "File: $filename" >> "$REPORT_FILE"

        # 1.b Size in bytes
        filesize=$(stat -c %s "$file")
        echo "Size: $filesize bytes"
        echo "Size: $filesize bytes" >> "$REPORT_FILE"

        # 1.c Last modified date
        last_modified=$(stat -c %y "$file")
        echo "Last Modified: $last_modified"
        echo "Last Modified: $last_modified" >> "$REPORT_FILE"

        # 1.d Current permissions
        permissions=$(stat -c %a "$file")
        echo "Permissions: $permissions"
        echo "Permissions: $permissions" >> "$REPORT_FILE"
   # 2. Check if permissions are more open than 644
        if (( permissions > 644 )); then
            echo "SECURITY RISK DETECTED"
            echo "SECURITY RISK DETECTED" >> "$REPORT_FILE"
        fi

