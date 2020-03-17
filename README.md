# Steven Cagle's dotfiles
Based on [Kraymer's dotfiles](https://github.com/Kraymer/F-dotfiles), which supplies a nifty way of formatting dotfiles in a component-based system. 

## Dependencies 
- `stow 2.3` - GNU Stow which is a dotfile farm sym-linker which is super useful for deploying packages on a new system.
    - MacOS with Homebrew: 
    ```bash
    brew install stow
    ```
    - Ubuntu: 
    ```bash
    # I use relative path expansion for ~/.stowrc introduced in stow 2.3
    #   You can use an older stow, as long as you manually set an absolute path 
    #   for --target in ~/.stowrc
    sudo add-apt-repository ppa:dns/gnu
    sudo apt-get update
    sudo apt-get install stow
    ```
    - Arch Linux: 
    ```bash
    pacman -S stow
    ```

## Install Packages
_Or "stow packages"_
```bash
git clone https://github.com/scagle/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# creates ~/.config if needed and stows "stow/" first which is important.
./initialize.sh  

stow <package-directory>
stow bash
stow vim_plus
# etc
```

## Uninstall Packages
_Or "unstow packages"_
```bash
cd ~/.dotfiles

# Option #1
# Make sure you unstow any subpackages first
stow -D <package-directory>
stow -D bash
stow -D vim_plus
# etc

# Option #2 
# Automatically unstows all stowed packages
./unstow_all.sh  
```
### Naming Conventions
[Kraymer's dotfiles](https://github.com/Kraymer/F-dotfiles) supplied a format for naming packages to make 
it easier for the reader to understand what's going on. I kept the structure but changed the naming 
scheme a bit, since I do not personally like symbols like `@` being used in filenames.
- lowercase for packages that are installed in `$HOME` 
    - (EX: [`bash`](https://github.com/scagle/dotfiles/blob/master/bash/))
- titlecase for packages that must be called with `sudo stow -d / <package-directory>` to install in `/` 
    - (EX: `SomeDaemonWhichIHaveNotCreatedYet`)
- `_plus` suffix or a `_plus_`<sup>[1]</sup> for packages that also contain subpackages
    - (EX: [`vim_plus`](https://github.com/scagle/dotfiles/blob/master/vim_plus/))
- `_sub` suffix or a `_sub_`<sup>[1]</sup> for subpackages 
    - (EX: [`vim_plus/nvim_sub`](https://github.com/scagle/dotfiles/blob/master/vim_plus/nvim_sub))
- `_init` suffix or a `_init_`<sup>[1]</sup> for packages that also contain `initialization.sh` scripts
    - (EX: [`tmux_init`](https://github.com/scagle/dotfiles/blob/master/tmux_init), [`zsh_init`](https://github.com/scagle/dotfiles/blob/master/zsh_init))
- `_` prefix for environment/system-specific packages
    - (EX: [`_mac`](https://github.com/scagle/dotfiles/blob/master/_mac/), [`_linux`](https://github.com/scagle/dotfiles/blob/master/_linux/))
- `__` prefix for non packages meaning that these directories **MUST NOT BE STOWED** 
    - (EX: [`__dpkg`](https://github.com/scagle/dotfiles/blob/master/__dkpg), [`__homebrew`](https://github.com/scagle/dotfiles/blob/master/__homebrew)) 

### Secret files 

> Files that contain sensitive information and should not be published are kept secret using package specific `.gitignore` files.  
> These files are prominently listed in the package `README.md` with a ✏ symbol aside.  
> Because the secret file itself is not tracked, a template is commited instead having same name but with the `.local` suffix appended. This template is intended to serve as a base for edition and can be renamed (removing the suffix) after its content is edited.

[1] - Allows for combinations, so "package_init_sub_plus" would work (although in retrospect that looks ridiculous :weary:).
