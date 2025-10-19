# GitHub Account Switcher Setup (Windows)

## Overview
This guide explains how to configure and use the PowerShell script on Windows to switch between personal and work/college GitHub accounts. It helps prevent issues where your commits or pushes use the wrong GitHub identity because Git retains the last authenticated account.

### 1) Create a dedicated folder for scripts

```powershell
mkdir "$env:USERPROFILE\Documents\GitHubScripts"
cd "$env:USERPROFILE\Documents\GitHubScripts"
```

### 2) Create the switcher script

Open Notepad to create the script:

```powershell
notepad "$env:USERPROFILE\Documents\GitHubScripts\switch-github.ps1"
```

Paste the following code into Notepad:

```powershell
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('personal','college')]
    [string]$account
)

$currentAccountFile = "$env:USERPROFILE\.current_github_account.txt"

if ($account -eq 'personal') {
    Write-Host "`nSwitching to PERSONAL GitHub account...`n"
    git config --global user.name '<your-personal-github-username>'
    git config --global user.email '<your-personal-email>'
    gh auth logout --hostname github.com
    gh auth login --hostname github.com --git-protocol https --web
    'personal' | Out-File -FilePath $currentAccountFile -Encoding utf8
}
elseif ($account -eq 'college') {
    Write-Host "`nSwitching to COLLEGE GitHub account...`n"
    git config --global user.name '<your-college-github-username>'
    git config --global user.email '<your-college-email>'
    gh auth logout --hostname github.com
    gh auth login --hostname github.com --git-protocol https --web
    'college' | Out-File -FilePath $currentAccountFile -Encoding utf8
}
else {
    Write-Host "Usage: .\switch-github.ps1 personal or .\switch-github.ps1 college"
}

Write-Host "`nCurrent Git configuration:"
git config --global user.name
git config --global user.email
```

Save and close Notepad.

### 3) Allow scripts to run

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 4) Test the script

```powershell
cd "$env:USERPROFILE\Documents\GitHubScripts"
powershell -ExecutionPolicy Bypass -File ".\switch-github.ps1" personal
powershell -ExecutionPolicy Bypass -File ".\switch-github.ps1" college
```

### 5) Add a global shortcut

Open your PowerShell profile:

```powershell
notepad $PROFILE
```

Add the following function at the bottom:

```powershell
function ghswitch {
    param([string]$account)
    & "$env:USERPROFILE\Documents\GitHubScripts\switch-github.ps1" $account
}
```

Save and close Notepad.

Reload your profile:

```powershell
. $PROFILE
```

### 6) Use it globally

```powershell
ghswitch personal
ghswitch college
```

### Verification

Check your Git configuration:

```powershell
git config user.name
git config user.email
```

Check your GitHub CLI authentication status:

```powershell
gh auth status
```
