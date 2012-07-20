# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

LANG=ja_JP.UTF-8
# LANG=en_US.utf8

### PATH
PATH=$PATH:$HOME/bin


# OS別環境設定
if [ `uname` = "Linux" ]; then
  # for Linux
  PATH=$PATH:/usr/local/tmux/bin
  PATH=$PATH:/usr/local/ctags/bin
  
  alias vim='/usr/local/vim-7.3/bin/vim'
  alias vimdiff='/usr/local/vim-7.3/bin/vimdiff'

elif [ `uname` = "Darwin" ]; then
  # for Mac
  PATH=$PATH:/usr/local/tmux/bin
  PATH=$PATH:/usr/local/ctags/bin

fi

export PATH

### bashのモード
# set -o vi
# set -o emacs

export TERM=xterm-256color

### Alias
alias l.='ls -d .*'
alias ll='ls -l'
alias lll='ls -al'
alias rm='rm -i'
alias vi='vim'
alias rm='rm -i'
alias wget='wget --no-check-certificate'
# -S オプションで折り返さなくする
# エディタはvim
alias mysql="EDITOR=\"/usr/local/vim-7.3/bin/vim -c ':set ft=sql'\" mysql --auto-rehash --pager='less -S'"

### SVN
# svn に登録されていないファイルをまとめて svn add
alias svnadd="svn st | grep '^\?' | sed -e 's/\?[ ]*/svn add /g' | sh" 
# ignoreも含めてstatus確認。
alias svnst="svn st --no-ignore"
# バージョン管理下の属性を一覧表示
alias svnpl="svn proplist -Rv"

### Git
# gitのブランチの情報を婦論プロトに表示させておく
# export PS1="[\u@\h \W]\$(__git_ps1) \$ "
export PS1='[\u@\h \W$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '
