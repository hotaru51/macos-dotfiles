# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Homebrew git
brew_git_home=/usr/local/Cellar/git
if [ -d ${brew_git_home} ]; then
    git_version=`ls ${brew_git_home} | sort | tail -1`
    PATH=${brew_git_home}/${git_version}/bin/:$PATH
    export PS1='[\u@\h \W$(__git_ps1)]\$ '
fi
unset brew_git_home
unset git_version

# anyenv
test -f /usr/local/bin/anyenv && eval "$(anyenv init -)"

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
