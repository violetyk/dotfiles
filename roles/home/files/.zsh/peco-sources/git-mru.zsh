#!/bin/zsh

function peco-git-branches () {
  # exists? .git/
  git rev-parse --git-dir >/dev/null 2>&1
  if [[ $? == 0 ]]; then
    local selected="$(git for-each-ref --format="%(refname) (%(authordate:relative))" --sort=-committerdate refs/heads/ refs/remotes/ refs/tags/ | sed -e "s/^refs\///g" | peco --query "$LBUFFER" --prompt "[GIT BRANCH] >")"
    if [ -n "$selected" ]; then
      local branch_type=${selected%%/*}
      local branch_name=${selected[(w)1]#(heads|remotes|tags)/}
      case "$branch_type" in
        "heads"|"tags")
          BUFFER="git checkout $branch_name"
          zle accept-line
          ;;
        "remotes")
          BUFFER="git checkout -t $branch_name"
          zle accept-line
          ;;
      esac
    fi
  fi
  zle redisplay
}
zle -N peco-git-branches
