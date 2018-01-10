function peco_select_fd_edit
  set -l query (commandline)
  set -l peco_flags --layout=top-down --prompt "$EDITOR ❯"

  if test -n $query
    set peco_flags $peco_flags --query "$query"
  end

  fd --type file --follow --hidden --full-path --exclude .git | peco $peco_flags | read line

  if [ $line ]
    eval $EDITOR $line
    commandline -f repaint
  end
end
