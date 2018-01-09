function peco_select_history
  set -l query (commandline)
  set -l peco_flags --layout=top-down --prompt "history ❯"

  if test -n $query
    set peco_flags $peco_flags --query "$query"
  end

  # コマンド履歴から重複行を削除してから絞り込む
  history | awk '!a[$0]++' | peco $peco_flags | read line

  if [ $line ]
    commandline $line
    commandline -f repaint
  end
end
