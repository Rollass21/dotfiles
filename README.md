# Roland’s dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should FIRST FORK THIS REPOSITORY, REVIEW THE CODE, AND REMOVE THINGS YOU DON’T WANT OR NEED. Don’t blindly use my settings unless you know what that entails.

Remember that these dotfiles may contain my personal git credentials, make sure to replace them with yours (So you dont accidentally commit under my name).

**Use at your own risk!**

### Settings
You can and should modify provided settings variables in (create_symlinks.sh)[./scripts/install/create_symlinks.sh] and (install_packages.sh)[./scripts/install/install_packages.sh]. Notably the dotfiles symlinks locations and packages you wish to install.

### Using Git and the install script

You can clone the repository wherever you want, just remember to change the $DOTFILES_DIR in (install.sh)[install.sh], default location being ~/dotfiles.

```bash
cd ~ &&
git clone https://github.com/schullzroll/dotfiles.git &&
cd dotfiles &&
git submodule update --init --recursive &&
bash install.sh
```

### Git-free install

Don't forget to perform a git submodule update on .vim/bundle/Vundle!
To install these dotfiles without Git:

```bash
cd; curl -L https://github.com/schullzroll/dotfiles/tarball/master | tar -xz
cd <untarred repo> && bash install.sh
```

