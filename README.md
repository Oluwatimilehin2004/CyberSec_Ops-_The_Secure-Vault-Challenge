# Secure Vault Automation (Bash Project)

##  Table of Contents
- [ Overview](#-overview)
- [ Project Structure](#-project-structure)
  - [1. vault_setup.sh](#1-vault_setupsh)
  - [2. vault_permissions.sh](#2-vault_permissionssh)
  - [3. vault_ops.sh](#3-vault_opssh)
  - [4. vault_monitor.sh](#4-vault_monitorsh)
- [ How It Works (Flow)](#️-how-it-works-flow)
- [ Real-Life Benefits](#-real-life-benefits)
- [ How to Run](#-how-to-run)
- [ Commands to Know](#-commands-to-know)

---

##  Overview
This project simulates a **secure vault system** using **Bash shell scripting**.  
It involves creating a vault (`secure_vault/`), managing its files (`keys.txt`, `secrets.txt`, `logs.txt`), controlling permissions, performing vault operations, and monitoring security risks.  

The project demonstrates Linux skills in:
- File & directory management  
- I/O redirection  
- Permissions handling (`chmod`)  
- Loops & conditionals in Bash  
- File monitoring with `stat`  
- User interaction in shell scripts  

---

##  Project Structure
The project consists of **4 main scripts**:

### 1. `vault_setup.sh`
- Creates `secure_vault/` in the user’s home directory.  
- Inside, it creates:
  - `keys.txt` → stores encryption keys  
  - `secrets.txt` → stores confidential data  
  - `logs.txt` → stores system logs  
- Adds welcome messages to each file using **I/O redirection (`>` and `>>`)**.  
- Prints a success message and lists all files in long format (`ls -l`).  

### 2. `vault_permissions.sh`
- Ensures `secure_vault/` exists; otherwise exits with an error.  
- For each file, displays current permissions.  
- Asks the user if they want to update permissions:  
  - **Yes** → user provides new permission (e.g., `600`).  
  - **No input (Enter)** → applies default permissions:  
    - `keys.txt` → `600`  
    - `secrets.txt` → `640`  
    - `logs.txt` → `644`  
  - **No (N/n)** → skips file.  
- Uses a **function** to handle updates.  
- Displays final permissions at the end.  

### 3. `vault_ops.sh`
Menu-driven program with options:
1. **Add Secret** → Append a new secret to `secrets.txt`.  
2. **Update Secret** → Replace a secret using `sed -i`. If not found → `"No match found."`  
3. **Add Log Entry** → Adds a timestamped log entry to `logs.txt`.  
4. **Access Keys** → Always prints `"ACCESS DENIED 🚫"` (keys are never shown).  
5. **Exit** → Quits the program.  

Runs in a loop (`while true`) until **Exit** is chosen.

### 4. `vault_monitor.sh`
- Scans each file inside `secure_vault/`.  
- Reports:
  - File name  
  - File size (in bytes)  
  - Last modified date  
  - Current permissions (symbolic + numeric)  
- If any file has permissions **more open than 644**, prints:  


- Saves results into `vault_report.txt` inside `secure_vault/`.  
- Prints confirmation after report generation.  

---

## How It Works (Flow)
1. **Setup** → Run `vault_setup.sh` to initialize vault and files.  
2. **Permissions** → Run `vault_permissions.sh` to configure security rules.  
3. **Operations** → Use `vault_ops.sh` to interact with vault contents.  
4. **Monitoring** → Run `vault_monitor.sh` to generate a detailed security report.  

---

##  Real-Life Benefits
This project simulates **core concepts of system security**:
- **Access control** → Controlling who can read/write sensitive files.  
- **Audit logging** → Keeping track of system activity in logs.  
- **Data confidentiality** → Protecting secrets from unauthorized access.  
- **Monitoring & alerts** → Detecting misconfigured permissions.  

In real systems, these ideas apply to:
- Password managers  
- Secure server configuration  
- Compliance (HIPAA, GDPR)  
- Cloud storage security
---

##  How to Run
### 1. Make scripts executable:
```bash
chmod u+x vault_setup.sh vault_permissions.sh vault_ops.sh vault_monitor.sh

### Run each script:
./vault_setup.sh         Step 1: create vault + files
./vault_permissions.sh   Step 2: set permissions
./vault_ops.sh           Step 3: run operations menu
./vault_monitor.sh       Step 4: generate monitoring report

### Check generated files:
secrets.txt → holds confidential data
logs.txt → system logs with timestamps
keys.txt → (hidden) encryption keys (but locked by ACCESS DENIED)
vault_report.txt → monitoring report

### Commands to Know
echo → print messages / write to files
> → redirect output (overwrite file)
>> → append to file
ls -l → list files with details
chmod → change file permissions
stat → get detailed file info
sed -i → update file contents in place
date → generate timestamps
read → take input from user
