function peco_select_fd_cd
  set -l query (commandline)
  set -l peco_flags --layout=top-down --prompt "cd ❯"

  if test -n $query
    set peco_flags $peco_flags --query "$query"
  end

  fd --type directory --follow --hidden --full-path --exclude .git | peco $peco_flags | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end
