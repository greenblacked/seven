> ## This is the main scripts for set up desktop environment on Linux and Windows. Enjoy it

### Installation for Windows by [choco_install.ps1](https://github.com/greenblacked/seven/blob/master/choco_install.ps1 "choco_install.ps1")
First of all you need to downaload the script 
```ps1
wget "https://raw.githubusercontent.com/greenblacked/seven/master/choco_install.ps1" -outfile "choco_install.ps1"
```
### And run it in powershell with admin access
```ps1
PS C:\Users\User\Downloads>  .\choco_install.ps1 .\choco_install.ps1
```
### After seccusfull setup you can select the next several options:
```ps1
cup all -y  # for update all of yours packages
choco uninstall [package_name] # for delete the package
choco list --local-only # discribe all installed package
```

### Installation for linux by [install_Env.sh](https://github.com/greenblacked/seven/blob/master/install_Env.sh "install_Env.sh")
First of all you need to downaload the script 
```sh
$ wget https://raw.githubusercontent.com/greenblacked/seven/master/install_Env.sh
```
#### And open it in terminal with sudo access
```sh
$ sudo sh install_Env.sh
```
