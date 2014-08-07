#!/bin/sh

# mkdir + cd
mkdircd() {
  mkdir -p $1 && cd $1
}


# Get list from file. The line of # is comment the top.
list() {
  LIST=''
  for ITEM in `cat $1 | grep -v "^#"`
  do
    # if [ -e $ITEM ] ; then
      LIST="$LIST $ITEM"
    # fi
  done

  echo $LIST
}


# tmuxで設定できる色一覧
tmux_colors() {
  for i in {255..0} ; do
    printf "\x1b[38;5;${i}mcolour${i} "
  done
  printf "\n"
}
