#!/bin/bash

wrapper(){
    start=$(date +%s)
    "$@"
    [ $(($(date +%s) - start)) -le 15 ] || notify-send "Notification" "Long\
 running command \"$(echo $@)\" took $(($(date +%s) - start)) seconds to finish"
}

#prompt_dir(){
#    dialog --title "Choose destination" --radiolist "Destinations" 30 30 3 bin "" ON python "" OFF test "" OFF
#    echo $?
#}

# Work aliases
alias cdu='cd $(git rev-parse --show-toplevel)'
alias cddev='cd ~/Development'
alias cdccb='cd ~/Development/CCB/'
alias cdpy='cd ~/Development/CCB/Environment/Build/scripts/python'
alias cdtest='cd ~/Development/CCB/Environment/Build/tools/test'
alias cdbin='cd ~/Development/CCB/Environment/Build/bin'
alias cdcmake='cd ~/Development/CCB/Environment/Build/cmake'
alias rcdpy='cd Environment/Build/scripts/python'
alias rcdtest='cd Environment/Build/tools/test'
alias rcdbin='cd Environment/Build/bin'
alias rcdcmake='cd Environment/Build/cmake'
alias pyrunner='python3 ~/Development/CCB/Environment/Build/scripts/python/pyrunner.py'
alias pylint='python3 ~/Development/CCB/Environment/Build/scripts/python/pyrunner.py -run-lint'
alias pytest='python3 ~/Development/CCB/Environment/Build/scripts/python/pyrunner.py -run-test'
alias bsme='nvim ~/Development/CCB/library/**/build_sharp_model*.txt'
alias le='nvim ~/Development/CCB/MediaServices/Servo/sharp/**/limits.txt'
#alias cdmenu='promt_dir()'

# Generated aliases / paths
export GHS_MULTI_PATH="/opt/ghs/multi_wd024.1"
alias fcgchecker='python3.6 $HGST_IPFW_WORKSPACE_ROOT/../scripts/python/fcgchecker/main.py'
alias iwyuhelper='python3.6 $HGST_IPFW_WORKSPACE_ROOT/../scripts/python/iwyuhelper/main.py'
alias build="wrapper ./build.sh"
alias setup_environment="source ./setup_environment.sh"
alias setup="source ./setup.sh"
export NIAGARA_DIRECTORY="/usr/local/niagara"
export ARMDS5LIB="/usr/local/ARM_Compiler_5/lib"
export ARMDS5INC="/usr/local/ARM_Compiler_5/include"
export ARMDS5BIN="/usr/local/ARM_Compiler_5/bin64"
export GHS_LMHOST="salic01.hgst.com:2010"
export LM_LICENSE_FILE="7789@snjfwlic.sanjose.hgst.com:1700@rfwlic.rochester.hgst.com:10011@fwrepo.fujisawa.hgst.com"
