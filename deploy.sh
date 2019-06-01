#!/bin/sh

set -ue

pwd_dir=$(cd $(dirname $0); pwd)
backup_dir=${pwd_dir}/old
dotfiles=(.bash_profile .bashrc)

test ! -d ${backup_dir} && mkdir ${backup_dir}

for FILE in ${dotfiles[@]}
do
  # dotfileが存在する場合はバックアップ
  if [ -f ${HOME}/${FILE} ]; then
    mv ${HOME}/${FILE} ${backup_dir}
  fi

  # シンボリックリンク作成
  ln -s ${pwd_dir}/${FILE} ${HOME}/${FILE}
done
