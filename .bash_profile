
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

# Use neovim as preferred editor
export VISUAL=nvim

# bash git autocomplete
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# =============================================================================
# Aliases
# =============================================================================

alias bashprofile='vi ~/.bash_profile'
alias vimrc='vi ~/.vimrc'
alias tmuxconf='vi ~/.tmux.conf'
alias todo="vi ~/.todo.work.org"
alias tmux="TERM=screen-256color-bce tmux"

# Neovim -----------------------------------------------------------------------
alias vi=nvim
alias vim=nvim

# Git/hub ---------------------------------------------------------------------
alias git='hub'
alias g='git status'

# OpenVPN
alias Openvpn='cd /usr/local/Cellar/openvpn/2.4.6/ && sudo openvpn openvpn_internal.conf'

source ~/.wilfrid/docker
source ~/.wilfrid/gpg
source ~/.wilfrid/pass_qr
