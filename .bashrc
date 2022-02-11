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
    if [ "$#" -ge 1 ]; then
        grep -r -E '^[Hh]ost\s' ~/.ssh | awk '{print $NF}' | sed -e '/^\*$/d' | grep "${1}"
    else
        grep -r -E '^[Hh]ost\s' ~/.ssh | awk '{print $NF}' | sed -e '/^\*$/d'
    fi
}

# fssh
function fssh() {
    if [ ! -f "$(which fzf)" ]; then
        return 1
    fi

    if [ "$#" -ge 1 ]; then
        local ssh_hostname="$(ssh-hosts "${1}" | fzf)"
    else
        local ssh_hostname="$(ssh-hosts | fzf)"
    fi

    if [ -n "${ssh_hostname}" ]; then
        ssh "${ssh_hostname}"
    fi
}

# AWS CLI
if [ -f "$(which aws_completer)" ]; then
    complete -C "$(which aws_completer)" aws
fi

# Starship
if [ -f "$(which starship)" ]; then
    eval "$(starship init bash)"
fi

# read .bashrc_local
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
