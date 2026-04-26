#Requires -RunAsAdministrator

$ErrorActionPreference = 'Stop'

. "$PSScriptRoot\choco_install_common.ps1"

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

Show-ChocolateyLocalPackages
