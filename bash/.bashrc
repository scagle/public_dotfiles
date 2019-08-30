source /etc/bashrc
source /etc/bashrc_Apple_Terminal
source ~/.bash_profile
source ~/.profile

# Find In File
fif(){
    find . -type f -exec grep -n "$1" /dev/null {} + | less
}
