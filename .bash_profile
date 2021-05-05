# bash-completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Homebrew git
if [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh" ]; then
    export PS1='[\u@\h \W$(__git_ps1)]\$ '
fi

# anyenv
if [ -f "/usr/local/bin/anyenv" ]; then
    eval "$(anyenv init -)"
fi

# NeoVim
export XDG_CONFIG_HOME=~/.config

# read .bash_profile_local
if [ -f ~/.bash_profile_local ]; then
    . ~/.bash_profile_local
fi

# read .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
