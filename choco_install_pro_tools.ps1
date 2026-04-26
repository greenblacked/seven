#Requires -RunAsAdministrator

$ErrorActionPreference = 'Stop'

. "$PSScriptRoot\choco_install_common.ps1"

Install-ChocolateyIfMissing

$packages = @(
    'pester',
    'choco-package-list-backup',
    '7zip',
    'googlechrome',
    'tightvnc',
    'firefox',
    'fsviewer',
    'vivaldi',
    'doublecmd',
    'qbittorrent',
    'spotify',
    'calibre',
    'wget',
    'mobaxterm',
    'jq',
    'openvpn',
    'recuva',
    'everything',
    'aimp',
    'msiafterburner',
    'temurin',
    'slack',
    'powershell-core',
    'skype',
    'zoom',
    'viber',
    'telegram',
    'microsoft-teams.install',
    'git',
    'github-desktop',
    'awscli',
    'azure-cli',
    'notepadplusplus',
    'lightshot',
    'putty',
    'keepass',
    '1password',
    'k-litecodecpackfull',
    'sublimetext3',
    'virtualbox',
    'vagrant',
    'vscode',
    'vscode-icons',
    'vscode-powershell',
    'tortoisegit',
    'conemu',
    'adobereader',
    'winbox',
    'ccleaner.portable',
    'checksum',
    'rufus',
    'pycharm-community',
    'wireshark',
    'nmap'
)

Install-ChocoPackages -Packages $packages

Show-ChocolateyLocalPackages
