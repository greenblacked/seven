# Shared helpers for choco_install.ps1 and choco_install_pro_tools.ps1
# Dot-source from those scripts; do not run this file directly.

function Install-ChocolateyIfMissing {
    if (Get-Command choco -ErrorAction SilentlyContinue) {
        return
    }

    Write-Host 'Installing Chocolatey from the official bootstrap script...'
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol =
        [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
    $installScript = (New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')
    Invoke-Expression $installScript
}

function Install-ChocoPackages {
    param(
        [Parameter(Mandatory = $true)]
        [string[]] $Packages
    )

    foreach ($package in $Packages) {
        Write-Host "Installing $package..."
        choco install $package -y --no-progress
        if ($LASTEXITCODE -ne 0) {
            throw "choco install failed for '$package' (exit code $LASTEXITCODE)."
        }
    }
}

function Show-ChocolateyLocalPackages {
    choco list --local-only
    if ($LASTEXITCODE -ne 0) {
        throw "choco list failed (exit code $LASTEXITCODE)."
    }
}
