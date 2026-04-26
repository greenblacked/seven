Scripts and dotfiles for setting up a daily desktop environment on Windows and Linux.

This repository contains install scripts and helper configuration for quickly preparing a fresh workstation with common browsers, media tools, development utilities, archive tools, communication apps, terminal profiles, and shell helpers.

## Features

- Windows setup with Chocolatey package installation.
- Extended Windows setup for additional developer and power-user tools.
- Bash helper functions for daily Linux terminal usage.
- Windows Terminal configuration with PowerShell, Command Prompt, Git Bash, WSL, and Azure Cloud Shell profiles.
- MikroTik RouterOS examples for rotating Wi-Fi passwords.
- Basic post-install Chocolatey commands for updating, removing, listing, and backing up installed packages.
- Simple script structure that is easy to edit before running.

## Repository Contents

| File | Description |
| --- | --- |
| `choco_install.ps1` | Base Windows installer with common desktop packages. |
| `choco_install_pro_tools.ps1` | Extended Windows installer with additional admin, development, and productivity tools. |
| `bashrc` | Bash helper functions for updates, Git prompts, project initialization, and system info. |
| `Mikrotik_pw_auto.sh` | MikroTik RouterOS examples for Wi-Fi password rotation. |
| `settings.json` | Windows Terminal profile configuration. |

## Before You Run

Read each script before executing it. These scripts install many applications and some commands require Administrator or `sudo` access.

Recommended checks:

- Remove packages you do not need.
- Confirm package names are still available in Chocolatey or your Linux package repositories.
- Run Windows scripts from an elevated PowerShell session.
- Source the Bash helper file instead of executing it directly.
- Review MikroTik examples carefully before using them on a router.
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

## Bash Helpers

The `bashrc` file contains optional daily helpers:

- `apt-updater` for common apt maintenance.
- `find_largest_files` for quick disk usage checks.
- `set_git_prompt` for a compact Git-aware prompt.
- `git_init` for creating a new Git project folder.
- `sysinfo` for a quick terminal system summary.

Source it from your own `~/.bashrc`:

```sh
[ -f ~/seven/bashrc ] && source ~/seven/bashrc
```

Enable the Git prompt after sourcing:

```sh
set_git_prompt
```

Do not add `source ~/.bashrc` inside this file. Your main shell config should source this file, not the other way around.

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

## MikroTik Wi-Fi Password Rotation

`Mikrotik_pw_auto.sh` contains RouterOS script examples for rotating a wireless security profile password.

Before using it:

- Replace placeholder profile names and e-mail addresses.
- Test manually before scheduling.
- Avoid logging plain-text Wi-Fi passwords.
- Confirm that your RouterOS version supports the commands used by the example.
- Prefer a secure internal password generation method when possible.

## Troubleshooting

- If Chocolatey is not recognized, close and reopen PowerShell as Administrator.
- If a package fails to install, run `choco search package-name` to confirm the current package name.
- If Windows blocks script execution, run PowerShell as Administrator and check the execution policy.
- If Bash helpers fail, source the file in Bash and confirm required tools are installed.
- If WSL does not appear in Windows Terminal, confirm that the distro is installed with `wsl -l -v`.

## Notes

Some package names and repositories may change over time. Review and update the scripts periodically before using them on a new machine.
