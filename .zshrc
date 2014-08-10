#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# git-prompt.shの設定

# $()を展開する
setopt PROMPT_SUBST
# ステージ済みがある場合+、ステージしてない変更がある場合*を表示
GIT_PS1_SHOWDIRTYSTATE=true
# stashがある場合$を表示
GIT_PS1_SHOWSTASHSTATE=true
# untracked fileがある場合%を表示
GIT_PS1_SHOWUNTRACKEDFILES=false
# アップストリームとの差分を< >で表示
GIT_PS1_SHOWUPSTREAM='auto'
# 特定のタグやブランチをチェックアウトしていたときの表示
GIT_PS1_DESCRIBE_STYLE='branch'
# 色つき表示
GIT_PS1_SHOWCOLORHINTS=true

# PROMPT上書き
export PROMPT='[%n@%m %1~%F{green}$(__git_ps1 " (%s)")%f]%(#.#.$) '

# Customize to your needs...
# for file in $HOME/.{path,exports,aliases,functions,commonrc,local}; do
for file in $HOME/dotfiles/.{path,exports,aliases,functions,commonrc,local}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# git completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

# peco
if which peco > /dev/null; then
  for f ($HOME/.zsh/peco-sources/*) source "${f}"

  # keybind
  bindkey '^r' peco-select-history
  bindkey '^s' peco-ghq-look
  # bindkey '^f' peco-cdr
fi
