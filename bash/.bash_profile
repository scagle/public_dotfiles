# Forget commands with initial space
export HISTCONTROL=ignorespace

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias python='python3.6'
alias trans="osascript ~/transparency.scpt"
alias config="git --git-dir=$HOME/.myconfig/ --work-tree=$HOME"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# added by Anaconda3 4.1.1 installer
export PATH="/Users/scagle/anaconda/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# For AIRSDK
PATH="/Users/scagle/Applications/AIRSDK/bin:${PATH}"
export PATH

# For Flex
export PATH="/usr/local/opt/flex/bin:$PATH" 
export FLEX_HOME="/usr/local/opt/flex/"

# For Matlab
alias matlab='/Applications/MATLAB_R2018b.app/bin/matlab -nojvm -nodesktop -nosplash -nodisplay'

alias vi='/usr/local/bin/vim'

eraserange(){
    for h in $(seq $1 $2 | tac); do
        history -d $h
    done
    history -d $(history | tail -1 | awk '{print $1}')
}

erasetypos(){
    n=$(history | tail -1 | awk '{print $1}')
    eraserange $(( $n - $1 )) $(( $n - 1 ))
}
