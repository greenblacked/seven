#Requires -RunAsAdministrator

$ErrorActionPreference = 'Stop'

function Install-ChocolateyIfMissing {
    if (Get-Command choco -ErrorAction SilentlyContinue) {
        return
    }

    Write-Host 'Installing Chocolatey from the official bootstrap script...'
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function Install-ChocoPackages {
    param(
        [Parameter(Mandatory = $true)]
        [string[]] $Packages
    )

    foreach ($package in $Packages) {
        Write-Host "Installing $package..."
        choco install $package -y --no-progress
    }
}

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
    'ccleaner',
    'pycharm-community',
    'wireshark',
    'nmap'
)

Install-ChocoPackages -Packages $packages

choco list --local-only
