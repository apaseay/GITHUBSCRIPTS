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