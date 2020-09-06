### install chocolatey ###
#if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall")){
    #iex ((new-object net.webclient).DownloadString("https://chocolatey.org/install.ps1"))
#}
 #Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
cinst pester -version 2.0.2

choco install firefox -y
choco install chromium -y
choco install qbittorrent -y
#choco install utorrent -y
choco install aimp -y
choco install telegram -y
choco install slack -y
choco install powershell-core -y
#choco install powershell.portable -y
choco install 7zip -y
# choco install googlechrome -y
choco install skype -y
choco install git -y
choco install jdk8 -y
choco install notepadplusplus -y
#choco install atom -y
# choco install putty 
#choco install putty.portable -y
#choco install paint.net -y
choco install keepass -y
choco install opera -y
choco install k-litecodecpackfull -y
choco install sublimetext3 -y
choco install virtualbox -y
choco install vagrant -y
choco install vscode -y
choco install vscode-powershell -y
#choco install docker -y
choco install tortoisegit -y
choco install conemu -y
choco install adobereader -y
choco install puntoswitcher -y
# choco install wireshark -y
#choco install nmap
#choco install steam


############################################################   backup
choco install choco-package-list-backup
#choco upgrade choco-package-list-backup
#choco install packages.config -y
##### delete
#choco uninstall имя_пакета

choco list --local-only
