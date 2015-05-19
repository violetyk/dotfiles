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
# GIT_PS1_SHOWDIRTYSTATE=true
# stashがある場合$を表示
# GIT_PS1_SHOWSTASHSTATE=true
# untracked fileがある場合%を表示
# GIT_PS1_SHOWUNTRACKEDFILES=false
# アップストリームとの差分を< >で表示
GIT_PS1_SHOWUPSTREAM='auto'
# 特定のタグやブランチをチェックアウトしていたときの表示
GIT_PS1_DESCRIBE_STYLE='branch'
# 色つき表示
GIT_PS1_SHOWCOLORHINTS=true

# PROMPT上書き
export PROMPT='[%n@%m %1~%F{green}$(__git_ps1 " (%s)")%f]%(#.#.$) '

# Customize to your needs...
# for file in $HOME/dotfiles/.{path,exports,aliases,functions,commonrc,local}; do
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

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

## direnv
eval "$(direnv hook zsh)"

## composer completion
function _composer {
  # Emulate BASH's command line contents variable
  local -x COMP_LINE="$words"

  # Emulate BASH's cursor position variable, setting it to the end of the current word.
  local -x COMP_POINT
  (( COMP_POINT = ${#${(j. .)words[1,CURRENT]}} ))

  # Honour the COMPOSER_HOME variable if set
  local composer_dir=$COMPOSER_HOME
  if [ -z "$composer_dir" ]; then
    composer_dir=$HOME/.composer
  fi

  local RESULT STATUS
  local -x COMPOSER_CWD=`pwd`
  RESULT=("${(@f)$( cd $composer_dir && composer depends _completion )}")
  STATUS=$?;

  # Bail out if PHP didn't exit cleanly
  if [ $STATUS -ne 0 ]; then
    echo $RESULT;
    return $?;
  fi;

  compadd -- $RESULT
};
compdef _composer composer;

# awscli
[[ -s /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh
