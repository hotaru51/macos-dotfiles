# read .bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# asdf
asdf_home=$HOME/.asdf
test -f ${asdf_home}/asdf.sh && . $HOME/.asdf/asdf.sh
test -f ${asdf_home}/completions/asdf.bash && . $HOME/.asdf/completions/asdf.bash
unset asdf_home

# NeoVim
export XDG_CONFIG_HOME=~/.config
