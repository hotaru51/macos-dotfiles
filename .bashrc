# set command alias
alias ls="ls -G"
alias ll="ls -l"
alias la="ls -a"
if [ -f "/usr/local/bin/nvim" ]; then
    alias vi=nvim
    alias vim=nvim
fi

# ssh config hosts
ssh-hosts() {
    grep -r -E '^[Hh]ost\s' ~/.ssh | awk '{print $NF}' | sed -e '/^\*$/d'
}

# AWS CLI
if [ -f "$(which aws_completer)" ]; then
    complete -C "$(which aws_completer)" aws
fi

# read .bashrc_local
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
