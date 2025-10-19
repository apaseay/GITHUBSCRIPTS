# GitHub Account Switcher Setup (macOS)

## Overview

This guide explains how to configure and use the Bash/Zsh script on macOS to switch between multiple GitHub accounts.

### 1. Create the scripts folder

```bash
mkdir -p ~/GitHubScripts
cd ~/GitHubScripts
```

### 2. Create the script

Create and open the script file:

```bash
nano ~/GitHubScripts/switch-github.sh
```

Paste the following content into the file:

```bash
#!/bin/bash
ACCOUNT=$1
CURRENT_ACCOUNT_FILE="$HOME/.current_github_account.txt"

if [ -z "$ACCOUNT" ]; then
  echo "Usage: ./switch-github.sh [personal|college]"
  exit 1
fi

if [ "$ACCOUNT" = "personal" ]; then
  git config --global user.name "<your-personal-github-username>"
  git config --global user.email "<your-personal-email>"
  gh auth logout --hostname github.com
  gh auth login --hostname github.com --git-protocol https --web
  echo "personal" > "$CURRENT_ACCOUNT_FILE"
elif [ "$ACCOUNT" = "college" ]; then
  git config --global user.name "<your-college-github-username>"
  git config --global user.email "<your-college-email>"
  gh auth logout --hostname github.com
  gh auth login --hostname github.com --git-protocol https --web
  echo "college" > "$CURRENT_ACCOUNT_FILE"
else
  echo "Invalid argument. Use personal or college."
  exit 1
fi

git config --global user.name
git config --global user.email
```

Save and exit the editor.

### 3. Make the script executable

```bash
chmod +x ~/GitHubScripts/switch-github.sh
```

### 4. Add a global alias

Open your Zsh configuration file:

```bash
nano ~/.zshrc
```

Add the following line to create an alias:

```bash
alias ghswitch='~/GitHubScripts/switch-github.sh'
```

Save and exit the editor, then reload the configuration:

```bash
source ~/.zshrc
```

### 5. Use the script globally

Switch between your GitHub accounts by running:

```bash
ghswitch personal
```

or

```bash
ghswitch college
```

## Verification

To verify the current Git configuration, run:

```bash
git config user.name
git config user.email
```

## Note

- Replace `<your-personal-github-username>`, `<your-personal-email>`, `<your-college-github-username>`, and `<your-college-email>` in the script with your actual account details.
- The script uses GitHub CLI (`gh`) for authentication. Ensure it is installed and configured on your system.
- The script logs out and logs back in to switch accounts, so you will be prompted for authentication during the process.

## Author

Created by [Ayobami Pase].