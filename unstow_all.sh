#!/bin/bash

# Unstow all packages quickly and safely by doing it in a particular order

# Find all subpackages in order of shallow -> deep
find_subpackages_up_down () {
    MATCHES="*"
    while true;
    do
      NEW_MATCHES=$(echo $MATCHES)
      [ "$NEW_MATCHES" = "$MATCHES" ] && break
      for FILEPATH in $NEW_MATCHES
      do
          if [[ "$(basename -- $FILEPATH)" == *'@'* ]]; then
              echo $FILEPATH
          fi
      done
      MATCHES="$MATCHES/*"
    done 
}

# Unstow all subpackages in order of deep -> shallow
stow_subpackages_down_up () {
    SUBPACKAGES=$(find_subpackages_up_down | tr ' ' '\n' | tac)
    for SUBPACKAGE in $SUBPACKAGES
    do
        (cd $(dirname $SUBPACKAGE) && stow -D $(basename $SUBPACKAGE))
    done
}

# Unstow all subpackages bottom up to prevent aliens
stow_subpackages_down_up

# Unstow top level packages except stow/
stow -D $(ls -d */ | grep --invert-match "@" | grep --invert-match "stow")

# Unstow stow/
stow -D stow 