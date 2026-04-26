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
    'firefox',
    'googlechrome',
    'qbittorrent',
    'fsviewer',
    'calibre',
    'aimp',
    'temurin',
    '7zip',
    'skype',
    'viber',
    'telegram',
    'git',
    'notepadplusplus',
    'lightshot',
    'keepass',
    'k-litecodecpackfull',
    'sublimetext3',
    'adobereader',
    'ccleaner.portable',
    'steam'
)

Install-ChocoPackages -Packages $packages

choco list --local-only
