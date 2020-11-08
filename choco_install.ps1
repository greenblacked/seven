Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
cinst pester -version 2.0.2

choco install firefox -y
choco install adblockplus-firefox -y
choco install googlechrome -y
# choco install chromium -y
choco install adblockpluschrome -y
# choco install opera -y
choco install qbittorrent -y # torrent client
choco install fsviewer -y # FastStone Image Viewer
choco install calibre -y # reader
# choco install puntoswitcher -y # switcher for language
choco install aimp -y 
# choco install libreoffice-fresh -y
# choco install google-backup-and-sync -y
choco install jre8 -y # java engine
choco install openjdk8 -y
choco install 7zip -y
choco install skype -y
choco install viber -y
choco install telegram -y
choco install git -y
choco install jdk8 -y
choco install notepadplusplus -y
choco install lightshot -y # take a customizable screenshot
choco install keepass -y
choco install k-litecodecpackfull -y
choco install sublimetext3 -y
# choco install tortoisegit -y
choco install adobereader -y
# choco install dropbox -y
# choco install malwarebytes -y
# choco install ccleaner -y
choco install ccleaner.portable
# choco install gimp -y
# choco install atom -y
choco install steam -y
# choco install epicgameslauncher -y
# choco install origin -y
# choco install vagrant -y
# choco install virtualbox -y
# choco install wireshark -y

choco list --local-only
