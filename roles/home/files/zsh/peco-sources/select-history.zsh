#!/bin/zsh

function peco-select-history() {
  typeset tac
  if which tac > /dev/null; then
    tac=tac
  else
    tac='tail -r'
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER" --prompt="[HISTORY] >")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N peco-select-history
