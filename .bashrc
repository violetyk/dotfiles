# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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


### PATH
PATH=$HOME/bin:$PATH:/bin:/sbin
CONFIGS=()

### golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# OS別環境設定
if [ `uname` = "Linux" ]; then
  # pathは/etc/profile.d/に追加することにした

  alias ls='ls --color'


elif [ `uname` = "Darwin" ]; then
  # pathは/etc/paths.d/に追加することにした

  alias ls='gls --color'

  # CONFIGS=(${CONFIGS[@]} '/usr/local/git/contrib/completion/git-prompt.sh')
  # CONFIGS=(${CONFIGS[@]} '/usr/local/git/contrib/completion/git-completion.bash')
fi

export PATH
for CONFIG in ${CONFIGS[@]}; do
  if [ -e ${CONFIG} ]; then
    . ${CONFIG}
  fi
done


if [ -f ~/.dircolors ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors ~/.dircolors)
  fi
fi


if [ -d ~/etc/profile.d ]; then
  # for i in ~/etc/profile.d/*.{sh,bash}; do
  for i in ~/etc/profile.d/*; do
    if [ -r "$i" ]; then
      if [ "$PS1" ]; then
        . "$i"
      else
        . "$i" >/dev/null 2>&1
      fi
    fi
  done

  unset i
fi

### less
if [ -n `which source-highlight` ]; then
  export LESS='-R'
  export LESSOPEN='| ~/dotfiles/src-hilite-lesspipe.sh %s'
fi


### bashのモード
# set -o vi
# set -o emacs

export TERM=xterm-256color

### Alias
alias l.='ls -d .*'
alias ll='ls -l'
alias lll='ls -al'
alias rm='rm -i'
alias cp='cp -i'
alias vi='vim'
alias wget='wget --no-check-certificate'
alias grep='grep --color'
alias vmstat='vmstat -S M'

# -S オプションで折り返さなくする
# エディタはvim
alias mysql="EDITOR=\"vim -c ':set ft=sql'\" mysql --auto-rehash"
# alias mysql="EDITOR=\"/usr/local/vim-7.3/bin/vim -c ':set ft=sql'\" mysql --auto-rehash --pager='less -S'"

# svn に登録されていないファイルをまとめて svn add
alias svnadd="svn st | grep '^\?' | sed -e 's/\?[ ]*/svn add /g' | sh" 
# ignoreも含めてstatus確認。
alias svnst="svn st --no-ignore"
# バージョン管理下の属性を一覧表示
alias svnpl="svn proplist -Rv"

### Git
if [ -n "$SUDO_USER" ]; then
  export PS1='[\u@\h \W]# '
else
  export PS1='[\u@\h \W$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '
fi

# SSH
_ssh() {
  tmp=$(mktemp ~/tmp/XXXXXX)
  cat ~/dotfiles/.sshconfig ~/.ssh/config > "$tmp" 2>/dev/null
  /usr/bin/ssh -F "$tmp" "$@"
  rm -f "$tmp"
}
alias ssh='_ssh'

tssh() {
  if [ $# -eq 1 ]; then
    tmp=$(mktemp ~/tmp/XXXXXX)
    cat ~/dotfiles/.sshconfig ~/.ssh/config > "$tmp" 2>/dev/null
    ssh_cmd=$(printf '/usr/bin/ssh -t -F %s %s' "$tmp" "$@")
    tmux new-window -n $1 "$ssh_cmd"
    rm -f "$tmp"
  fi
}
