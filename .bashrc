# set command alias
alias ls="ls -G"
alias ll="ls -l"
alias la="ls -a"
if [ -f /usr/local/bin/nvim ]; then
  alias vi=nvim
  alias vim=nvim
fi

# Homebrew git completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash \
  -a -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  source /usr/local/etc/bash_completion.d/git-prompt.sh
fi
