#!/bin/bash
VAULT_DIR="$HOME/secure_vault"
REPORT_FILE="$VAULT_DIR/vault_report.txt"

> "$REPORT_FILE"
for file in "$VAULT_DIR"/*; do
    if [[ -f $file ]]; then
        
        filename=$(basename "$file")
        echo "File: $filename"
        echo "File: $filename" >> "$REPORT_FILE"

        
        filesize=$(stat -c %s "$file")
        echo "Size: $filesize bytes"
        echo "Size: $filesize bytes" >> "$REPORT_FILE"

        
        last_modified=$(stat -c %y "$file")
        echo "Last Modified: $last_modified"
        echo "Last Modified: $last_modified" >> "$REPORT_FILE"

        
        permissions=$(stat -c %a "$file")
        echo "Permissions: $permissions"
        echo "Permissions: $permissions" >> "$REPORT_FILE"
   
        if (( permissions > 644 )); then
            echo "SECURITY RISK DETECTED"
            echo "SECURITY RISK DETECTED" >> "$REPORT_FILE"
        fi
        
	echo "------------------------------------"
        echo "------------------------------------" >> "$REPORT_FILE" 
    fi
done

   
        
        echo "Vault report created at $REPORT_FILE"
