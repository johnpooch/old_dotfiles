
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

PS1='\h:\w\$ '
PS2='> '

# Can `cd` into a repo from any location
CDPATH=:'~/src'

export DOCKER_UID=$UID
export PATH=/usr/local/sbin:$PATH
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Aliases
alias bashprofile='vi ~/.bash_profile'
alias vimrc='vi ~/.vimrc'
alias tmuxconf='vi ~/.tmux.conf'
alias todo="vi /Users/john/.todo.org"
alias tmux="TERM=screen-256color-bce tmux"

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
source /Users/john/.wilfrid/docker
source /Users/john/.wilfrid/gpg
source /Users/john/.wilfrid/pass_qr

