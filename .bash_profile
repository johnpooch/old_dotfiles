
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Can `cd` into a repo from any location
CDPATH=:'~/src'

PS1='\h:\w\$ '
PS2='> '


set -o vi

export DOCKER_UID=$UID
export PATH=/usr/local/sbin:$PATH
alias todo="vim /Users/john/.todo.org"

function docker_watch {
    watch "docker ps --format 'table {{.Names}}\t{{.Ports}}'"
}

function docker_logs {
    while [ 1 ]
    do
        docker logs $1 -f
        echo "Logs for container '$1' exited..."
        sleep 5
        echo "Retrying.."
    done
}

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source /Users/john/.wilfrid/docker

export PASSWORD_STORE_DIR=/Users/john/src/password-store

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Aliases
alias bashprofile='vi ~/.bash_profile'
alias vimrc='vi ~/.vimrc'

# OpenVPN
alias Openvpn='cd /usr/local/Cellar/openvpn/2.4.6/ && sudo openvpn openvpn_internal.conf'

# Git
alias g='git status'
alias gc='git commit'
alias gb='git branch'
alias gch='git checkout'
alias gplo='git pull origin'
alias gpso='git push origin'
alias gl='git log'

source ~/.bash_secrets
