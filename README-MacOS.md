# GitHub Account Switcher Setup (macOS)
## Overview
This guide explains how to configure and use the Bash/Zsh script on macOS to switch between multiple GitHub accounts.
--
### 1. Create the scripts folder
```bash
mkdir -p ~/GitHubScripts
cd ~/GitHubScripts
2. Create the script
nano ~/GitHubScripts/switch-github.sh
Paste the following:
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
3. Make it executable
chmod +x ~/GitHubScripts/switch-github.sh
4. Add a global alias
nano ~/.zshrc
Add this line:
alias ghswitch='~/GitHubScripts/switch-github.sh'
Save and reload:
source ~/.zshrc
5. Use it globally
ghswitch personal
ghswitch college
Verification
git config user.name
git config user.email
--