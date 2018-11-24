#!/bin/sh

set -ue

pwd_dir=$(cd $(dirname $0); pwd)
shl_name=`basename $0`
old_dir=${HOME}/.old_dotfiles
tmp=/tmp/${shl_name}.$$.tmp

ls ${pwd_dir} | grep -v "${shl_name}"> ${tmp}
cat ${tmp} | while read FILE
do
  dot_file=".${FILE}"
  if [ -f ${HOME}/${dot_file} ]; then
    # バックアップ先がない場合は新規作成
    test ! -d ${old_dir} && mkdir ${old_dir}

    # バックアップ
    echo "backup ${dot_file} into ${old_dir}"
    cp -p ${HOME}/${dot_file} ${old_dir}

    # 配置
    echo "deploy ${FILE}"
    cp -p ${pwd_dir}/${FILE} ${HOME}/${dot_file}
  fi
done

rm -f ${tmp}
