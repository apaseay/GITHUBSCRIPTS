# GitHub Account Switcher Setup (Linux / Ubuntu)

## Overview

This guide explains how to configure and use the Bash script on Linux or Ubuntu to switch between multiple GitHub accounts.

- --

### 1. Create the scripts folder

```bash

mkdir -p ~/GitHubScripts

cd ~/GitHubScripts

**2. Create the script**

nano ~/GitHubScripts/switch-github.sh

Paste the same Bash script as in the macOS guide.

**3. Make it executable**

chmod +x ~/GitHubScripts/switch-github.sh

**4. Add a global alias**

nano ~/.bashrc

Add:

alias ghswitch='~/GitHubScripts/switch-github.sh'

Reload:

source ~/.bashrc

**5. Use it globally**

ghswitch personal

ghswitch college

# **Verification**

git config user.name

git config user.email

- --