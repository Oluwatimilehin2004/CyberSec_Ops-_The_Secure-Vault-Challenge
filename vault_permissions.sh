#! /bin/bash
vault_dir="$HOME/secure_vault"
if [ ! -d "$vault_dir" ]; then
echo " Error: secure_vault directory not found"
exit 1
fi
