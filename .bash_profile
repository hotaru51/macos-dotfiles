# read .bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Homebrew git
brew_git_home=/usr/local/Cellar/git
if [ -d ${brew_git_home} ]; then
  git_version=`ls ${brew_git_home} | sort | tail -1`
  PATH=${brew_git_home}/${git_version}/bin/:$PATH
fi

# asdf
asdf_home=$HOME/.asdf
test -f ${asdf_home}/asdf.sh && . ${asdf_home}/asdf.sh
test -f ${asdf_home}/completions/asdf.bash && . ${asdf_home}/completions/asdf.bash
unset asdf_home

# NeoVim
export XDG_CONFIG_HOME=~/.config

# Java
JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home
PATH=$PATH:$JAVA_HOME/bin

export PATH JAVA_HOME
