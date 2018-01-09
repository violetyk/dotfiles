function peco_select_ghq_look
  set -l query (commandline)
  set -l peco_flags --layout=top-down --prompt "ghq look ❯"

  if test -n $query
    set peco_flags $peco_flags --query "$query"
  end

  ghq list | peco $peco_flags | read line

  if [ $line ]
    ghq root | read dir
    cd $dir/$line
    commandline -f repaint
  end
end
