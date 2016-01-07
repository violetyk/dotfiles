#!/bin/zsh

# integrate all source code with ghq
function peco-ghq-look() {
  local selected_dir=$(ghq list | peco --query "$LBUFFER" --prompt="[GHQ] >")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${GOPATH}/src/${selected_dir}"
    zle accept-line
    # create-session "${GOPATH}/src/${selected_dir}"
  fi
  zle redisplay
}
zle -N peco-ghq-look
stty -ixon
