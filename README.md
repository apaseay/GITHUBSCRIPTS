# GitHub Account Switcher (Windows, macOS & Linux)

## Overview

This project provides cross-platform scripts to automate switching between multiple GitHub accounts, such as a personal and a college/work account.

It ensures each commit and push uses the correct account identity, preventing unintentional contributions from another GitHub profile.

### Background

During development work, I discovered that my **college GitHub account appeared as a contributor** to my **personal repository**, even though I had authenticated using my personal account through `gh auth login` and browser authentication.

After researching, I learned that GitHub prioritizes the identity stored in **Git configuration (`user.name` and `user.email`)** over authentication tokens when making commits.

This means that even if you log in through the browser as one account, Git will still push commits under the **last configured identity**.

This project was created to automate that process, ensuring that Git and GitHub CLI (`gh`) always match the correct account before every push.

- --

## Features

- Supports **Windows**, **macOS**, and **Linux/Ubuntu**
- Uses official GitHub CLI (`gh`) for secure, browser-based authentication
- Prevents the wrong account from appearing as a contributor on repositories
- No credentials or tokens stored locally
- Simple one-line command: `ghswitch personal` or `ghswitch college`
- --

## File Structure

| File | Purpose |

|------|----------|

| `LICENSE` | Open-source license (MIT) |

| `.gitignore` | Ignore temporary or local files |

| `README-Linux.md` | Linux/Ubuntu setup instructions |

| `README-MacOS.md` | macOS setup instructions |

| `README-Windows.md` | Windows PowerShell setup instructions |

| `README.md` | Main documentation (overview for all platforms) |

| `switch-github.ps1` | PowerShell script for Windows users |

| `switch-github.sh` | Bash script for macOS and Linux users |

- --

## Platform Setup Guides

- [Windows Setup Guide](README-Windows.md)
- [macOS Setup Guide](README-MacOS.md)
- [Linux/Ubuntu Setup Guide](README-Linux.md)
- --

## Summary

| Account | Example Username | Example Email | Use Case |

|----------|------------------|----------------|-----------|

| Personal | `<your-personal-username>` | `<your-personal-email>` | Personal repositories and portfolio projects |

| College/Work | `<your-college-username>` | `<your-college-email>` | Coursework and institutional repositories |

| Command | Purpose |

|----------|----------|

| `ghswitch personal` | Switch to personal GitHub account |

| `ghswitch college` | Switch to college/work GitHub account |

| `. $PROFILE` / `source ~/.bashrc` | Reload PowerShell or shell profile |

| `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` | Allow PowerShell scripts to run (Windows) |

- --

## Security Notice

- These scripts do **not** store credentials, tokens, or secrets.
- They use GitHub CLI’s browser-based authentication, which is temporary and secure.
- Public versions of the scripts should keep **only placeholder values** for usernames and emails.
- Never commit your personal or institutional details to public repositories.
- --