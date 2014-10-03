LANG=ja_JP.UTF-8
# LANG=en_US.utf8

# コマンド履歴保存行数
export HISTSIZE=10000

# 重複する履歴は保存しない
# export HISTCONTROL=ignoredups

# 空白から始めたコマンドを保存しない
export HISTCONTROL=ignorespace

# 重複、空白開始コマンドの両方を保存しない
export HISTCONTROL=ignoreboth

# 履歴に保存しないコマンドの指定
export HISTIGNORE="jobs*:fg*:bg*:history*"

if [ -n "$SUDO_USER" ]; then
  export PS1='[\u@\h \W]# '
else
  export PS1='[\u@\h \W$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '
fi

for file in $HOME/dotfiles/.{path,exports,aliases,functions,commonrc,local}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

## direnv
eval "$(direnv hook bash)"
