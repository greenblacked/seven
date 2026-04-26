Scripts and dotfiles for setting up a daily desktop environment on Windows and Linux.

This repository contains install scripts and helper configuration for quickly preparing a fresh workstation with common browsers, media tools, development utilities, archive tools, communication apps, terminal profiles, and shell helpers.

## Features

- Windows setup with Chocolatey package installation (shared helpers, strict exit-code checks).
- Extended Windows setup for additional developer and power-user tools.
- Bash helper functions for daily Linux terminal usage.
- Windows Terminal configuration with PowerShell, Command Prompt, Git Bash, WSL, and Azure Cloud Shell profiles.
- MikroTik RouterOS examples for rotating Wi-Fi passwords.
- Basic post-install Chocolatey commands for updating, removing, listing, and backing up installed packages.
- Simple script structure that is easy to edit before running.

## Repository Contents

| File | Description |
| --- | --- |
| `choco_install_common.ps1` | Shared Chocolatey bootstrap and install helpers (dot-sourced by the installers below). |
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
- When using the Windows installers, keep `choco_install_common.ps1` in the **same folder** as `choco_install.ps1` or `choco_install_pro_tools.ps1` (clone the repo or download both files).
- Source the Bash helper file instead of executing it directly.
- Review MikroTik examples carefully before using them on a router.
- Create a restore point or backup before using the extended setup script on a production machine.

The Chocolatey bootstrap uses the official community install script over HTTPS. If you prefer to inspect it first, download [install.ps1](https://community.chocolatey.org/install.ps1) locally and run it from an elevated shell instead of relying on `Invoke-Expression` from the helper.

## Windows Installation

Download the shared helpers and the base installer into the **same directory**:

```ps1
$base = "https://raw.githubusercontent.com/greenblacked/seven/master"
Invoke-WebRequest "$base/choco_install_common.ps1" -OutFile "choco_install_common.ps1"
Invoke-WebRequest "$base/choco_install.ps1" -OutFile "choco_install.ps1"
```

Run the base script in PowerShell as Administrator from the folder where you saved the files (for example `cd ~\Downloads`):

```ps1
.\choco_install.ps1
```

If any `choco install` or the final `choco list` fails, the script stops and reports the exit code.

## Extended Windows Installation

Download the shared helpers (if you have not already) and the extended script:

```ps1
$base = "https://raw.githubusercontent.com/greenblacked/seven/master"
Invoke-WebRequest "$base/choco_install_common.ps1" -OutFile "choco_install_common.ps1"
Invoke-WebRequest "$base/choco_install_pro_tools.ps1" -OutFile "choco_install_pro_tools.ps1"
```

Review the package list before running:

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

**Copy** is bound to **Ctrl+Shift+C** so **Ctrl+C** can send an interrupt to the shell. Adjust key bindings in your own `settings.json` if you prefer different shortcuts.

WSL distro entries use machine-specific `guid` values. Treat this file as a template: after copying, compare with your live Windows Terminal `settings.json` (from **Settings → Open JSON file**) and merge profiles so GUIDs match distros actually installed on your PC.

To use the template, copy the contents into your Windows Terminal configuration after backing up your current settings.

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

On Chocolatey v2+, run `choco list --help` if flags or output differ from what you expect.

## Customization

Edit the `$packages` array near the bottom of `choco_install.ps1` or `choco_install_pro_tools.ps1`. Comment out a line or remove an entry to skip that package:

```ps1
$packages = @(
    '7zip',
    # 'virtualbox',   # skipped
    'vscode'
)
```

Use a full-line comment (line starts with `#`) to skip an entry. Do not comment out the only item on a line in the middle of the array in a way that leaves two commas with nothing between them.

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
- If a package fails to install, the installer stops: run `choco search package-name` to confirm the current package name, fix the list, and re-run (or install the failing package manually).
- If you see errors about `choco_install_common.ps1`, ensure that file sits in the same directory as the installer you are running.
- If Windows blocks script execution, run PowerShell as Administrator and check the execution policy.
- If Bash helpers fail, source the file in Bash and confirm required tools are installed.
- If WSL does not appear in Windows Terminal, confirm that the distro is installed with `wsl -l -v` and that your `settings.json` profile `guid` matches the distro.

## Notes

Some package names and repositories may change over time. Review and update the scripts periodically before using them on a new machine.
