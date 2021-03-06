Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
cinst pester -version 2.0.2

choco install choco-package-list-backup -y #for backup app
choco install 7zip -y
choco install googlechrome -y
# choco install vnc-viewer -y
choco install tightvnc -y
choco install firefox -y 
choco install adblockplus-firefox -y
# choco install chromium -y
choco install adblockpluschrome -y
choco install fsviewer -y # FastStone Image Viewer
choco install vivaldi -y
# choco install unchecky -y # Unchecky aims to keep potentially unwanted programs out of your computer
choco install doublecmd -y # file manager
choco install qbittorrent -y # torrent client
choco install spotify -y
choco install calibre -y # reader
# choco install filezilla.server -y # free FTP solution
choco install wget -y
choco install mobaxterm -y
choco install jq -y
choco install openvpn -y
choco install recuva -y # recovers files deleted from your Windows computer
choco install puntoswitcher -y # switcher for language
choco install everything -y # search engine
choco install aimp -y 
choco install msiafterburner -y
# choco install libreoffice-fresh -y 
choco install jre8 -y # java engine
choco install openjdk8 -y
choco install slack -y
choco install powershell-core -y
choco install skype -y
choco install zoom -y
choco install viber -y
choco install telegram -y
choco install microsoft-teams.install -y
# choco install skypeforbusiness -y
choco install git -y
choco install github-desktop -y
choco install awscli -y
choco install azure-cli -y
choco install jdk8 -y
choco install notepadplusplus -y
choco install lightshot -y # take a customizable screenshot
choco install putty -y
choco install keepass -y
# choco install keepass-keepasshttp -y
# choco install keepassxc -y
choco install 1password -y
# choco install opera -y
choco install k-litecodecpackfull -y
choco install sublimetext3 -y
choco install virtualbox -y
choco install vagrant -y
choco install vscode -y
choco install vscode-icons -y
choco install vscode-powershell -y
choco install tortoisegit -y
choco install conemu -y
choco install adobereader -y
choco install google-backup-and-sync -y
choco install winbox -y
# choco install pgadmin4 -y
choco install ccleaner.portable -y
choco install checksum -y # checksum validator
# choco install screenpresso -y # screen recorder
# choco install kodi -y # video manager
# choco install packer -y
# choco install gpu-z -y
# choco install brackets -y
# choco install lastpass -y
# choco install brave -y
choco install rufus -y
# choco install opera -y
# choco install cmake -y
choco install sublimetext3 -y
# choco install dropbox -y
# choco install malwarebytes -y
choco install ccleaner -y
# choco install gimp -y
# choco install nodejs.install -y
# choco install python2 -y
# choco install paint.net -y
# choco install tor-browser -y
# choco install phpstorm -y
choco install pycharm-community -y
# choco install powershell.portable -y
choco install atom -y
# choco install putty.portable -y
# choco install docker -y
# choco install utorrent -y
choco install wireshark -y
choco install nmap -y
# choco install steam -y
# choco install cdburnerxp -y
# choco install backupvault -y #backup app
choco list --local-only
