# Locations of custom bash files
BASHRC="$HOME/.bashrc_steven"
BASH_PROFILE="$HOME/.bash_profile_steven"

# Source all necessary files
if [ -f "$BASHRC" ]; then
	source "$BASHRC"
else
	echo "Can't locate $BASHRC"
fi

if [ -f "$BASH_PROFILE" ]; then
	source "$BASH_PROFILE"
else
	echo "Can't locate $BASH_PROFILE"
fi

# Leave room for things to auto-append to this bash_profile:
