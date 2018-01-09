function git_branch_mru
  git for-each-ref \
    --format="%(refname) (%(authordate:relative))" \
    --sort=-committerdate \
    refs/heads/ refs/remotes/ refs/tags/ \
    $argv # e.g., --count 10
end

