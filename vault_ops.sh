#!/bin/bash

cd $HOME/secure_vault

while true; do
    echo ""
    echo "===== SECURE VAULT MENU ====="
    echo "1) Add Secret"
    echo "2) Update Secret"
    echo "3) Add Log Entry"
    echo "4) Access Keys"
    echo "5) Exit"
    read -p "Choose an option [1-5]: " choice

    case $choice in
        1)
            read -p "Enter your new secret: " secret
            echo "$secret" >> secrets.txt
            echo "Secret added successfully!"
            ;;
        2)
            read -p "Enter the text to replace: " old
            read -p "Enter the new text: " new
            if grep -q "$old" secrets.txt; then
                sed -i "s/$old/$new/g" secrets.txt
                echo "Secret updated successfully!"
            else
                echo "No match found."
            fi
            ;;
        3)
            read -p "Enter log message: " logmsg
            echo "$(date '+%Y-%m-%d %H:%M:%S') - $logmsg" >> logs.txt
            echo "Log entry added!"
            ;;
        4)
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            echo "Exiting Vault Operations. Goodbye!"
            break
            ;;
        *)
            echo "Invalid option, please choose 1-5."
            ;;
    esac
done
	                
	
