Scripts for setting up a desktop environment on Windows and Linux.

This repository contains install scripts for quickly preparing a fresh workstation with common browsers, media tools, development utilities, archive tools, communication apps, and desktop helpers.

## Features

- Windows setup with Chocolatey package installation.
- Extended Windows setup for additional developer and power-user tools.
- Linux setup script for Ubuntu-based environments.
- Windows Terminal configuration with PowerShell, Command Prompt, Git Bash, WSL, and Azure Cloud Shell profiles.
- Basic post-install Chocolatey commands for updating, removing, listing, and backing up installed packages.
- Simple script structure that is easy to edit before running.

## Repository Contents

| File | Description |
| --- | --- |
| `choco_install.ps1` | Base Windows installer with common desktop packages. |
| `choco_install_pro_tools.ps1` | Extended Windows installer with additional admin, development, and productivity tools. |
| `install_Env.sh` | Linux installer for Ubuntu-based desktop environments. |
| `settings.json` | Windows Terminal profile configuration. |
| `alias_ssh_config` | Example SSH aliases/configuration. |

## Before You Run

Read each script before executing it. These scripts install many applications and some commands require Administrator or `sudo` access.

Recommended checks:

- Remove packages you do not need.
- Confirm package names are still available in Chocolatey or your Linux package repositories.
- Run Windows scripts from an elevated PowerShell session.
- Run the Linux script only on a compatible Ubuntu-based system.
- Create a restore point or backup before using the extended setup script on a production machine.

## Windows Installation

Download the base Windows setup script:

```ps1
wget "https://raw.githubusercontent.com/greenblacked/seven/master/choco_install.ps1" -outfile "choco_install.ps1"
```

Run it in PowerShell as Administrator:

```ps1
.\choco_install.ps1
```

## Extended Windows Installation

If you need additional packages, download the extended Windows script:

```ps1
wget "https://raw.githubusercontent.com/greenblacked/seven/master/choco_install_pro_tools.ps1" -outfile "choco_install_pro_tools.ps1"
```

Review it before running:

```ps1
notepad .\choco_install_pro_tools.ps1
```

Run it in PowerShell as Administrator:

```ps1
.\choco_install_pro_tools.ps1
```

## Linux Installation

Download the Linux setup script:

```sh
wget https://raw.githubusercontent.com/greenblacked/seven/master/install_Env.sh
```

Review it before running:

```sh
less install_Env.sh
```

Run it with sudo access:

```sh
sudo bash install_Env.sh
```

## Windows Terminal Settings

The included `settings.json` configures profiles for:

- Windows PowerShell
- Command Prompt
- Git Bash
- Ubuntu WSL
- Azure Cloud Shell

To use it, copy the settings into your Windows Terminal configuration after backing up your current settings.

Typical Windows Terminal settings location:

```text
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

## Useful Chocolatey Commands

After setup, these commands are useful for maintenance:

```ps1
cup all -y
choco uninstall $package_name
choco list --local-only
choco install choco-package-list-backup -y
choco install packages.config -y
```

## Customization

You can customize the setup by commenting or uncommenting package lines inside the scripts.

For example:

```ps1
# choco install virtualbox -y
choco install vscode -y
```

Lines starting with `#` are skipped. Remove the `#` to enable a package, or add `#` to disable one.

## Troubleshooting

- If Chocolatey is not recognized, close and reopen PowerShell as Administrator.
- If a package fails to install, run `choco search package-name` to confirm the current package name.
- If Windows blocks script execution, run PowerShell as Administrator and check the execution policy.
- If Linux packages fail, run `sudo apt update` and confirm that the required repository still exists.
- If WSL does not appear in Windows Terminal, confirm that the distro is installed with `wsl -l -v`.

## Notes

Some package names and repositories may change over time. Review and update the scripts periodically before using them on a new machine.
