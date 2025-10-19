# GitHub Account Switcher Setup (Linux / Ubuntu)

## Overview

This guide explains how to configure and use the Bash script on Linux or Ubuntu to switch between multiple GitHub accounts.

### 1. Create the scripts folder

```bash
mkdir -p ~/GitHubScripts
cd ~/GitHubScripts
```

### 2. Create the script

```bash
nano ~/GitHubScripts/switch-github.sh
```

Paste the same Bash script as in the macOS guide.

### 3. Make it executable

```bash
chmod +x ~/GitHubScripts/switch-github.sh
```

### 4. Add a global alias

```bash
nano ~/.bashrc
```

Add the following line to the file:

```bash
alias ghswitch='~/GitHubScripts/switch-github.sh'
```

Reload your shell configuration:

```bash
source ~/.bashrc
```

### 5. Use it globally

```bash
ghswitch personal
ghswitch college
```

## Verification

```bash
git config user.name
git config user.email
```

## Note

Make sure to replace `personal` and `college` with the actual names of your GitHub account profiles as configured in your script.



This script and guide were created to simplify switching between multiple GitHub accounts on Linux / Ubuntu systems.

## Author

Created by [Ayobami Pase].