<p align="center">
<h1>This is the main scripts for setting up a desktop environment on Linux and Windows. Enjoy it </h1>
</p>

### Installation for Windows by [choco_install.ps1](https://github.com/greenblacked/seven/blob/master/choco_install.ps1 "choco_install.ps1")
First of all you need to downaload the script 
```ps1
wget "https://raw.githubusercontent.com/greenblacked/seven/master/choco_install.ps1" -outfile "choco_install.ps1"
```
### And run it in powershell with admin access
```ps1
 .\choco_install.ps1
```

>### Also, if you need to install additional package you can to downaload the another script for windows, but before use it, please read it, you can find it by the following cmd

```ps1
wget "https://raw.githubusercontent.com/greenblacked/seven/master/choco_install_pro_tools.ps1" -outfile "choco_install.ps1"
```
### After a successful setup you can select the next several options:
```ps1
cup all -y  # for update all of yours packages
choco uninstall $package_name # for delete the package
choco list --local-only # describe all installed package
choco install choco-package-list-backup # creating a backup list of all installed packages
choco install packages.config -y # another one tool for backups
```

### Installation for linux by [install_Env.sh](https://github.com/greenblacked/seven/blob/master/install_Env.sh "install_Env.sh")
First of all you need to downaload the script 
```sh
$ wget https://raw.githubusercontent.com/greenblacked/seven/master/install_Env.sh
```
#### And open it in the terminal with sudo access
```sh
$ sudo sh install_Env.sh
```
