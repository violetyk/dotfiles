function peco_select_git_checkout
  set -l query (commandline)
  set -l peco_flags --layout=top-down --prompt "git checkout (-t) ❯"

  if test -n $query
    set peco_flags $peco_flags --query "$query"
  end

  # exists? .git/
  git rev-parse --git-dir >/dev/null 2>&1
  if test $status -eq 0

    git_branch_mru | sed -e "s/^refs\///g" | peco $peco_flags | read line
    set -l match (string match -r -i '^(heads|remotes|tags)/([\w\-/_#]+)(?=\s)' $line)

    if test $status -eq 0

      set -l branch_type $match[2]
      set -l branch_name $match[3]

      switch $branch_type
        case heads tags
          git checkout $branch_name
          commandline -f repaint
        case remotes
          git checkout -t $branch_name
          commandline -f repaint
        case '*'
          # do nothing
      end

    end

  end

end
