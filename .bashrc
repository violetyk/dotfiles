# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export TERM=xterm-256color

# User specific aliases and functions
alias vi='vim'
alias rm='rm -i'
alias wget='wget --no-check-certificate'
# svn に登録されていないファイルをまとめて svn add
alias svnadd="svn st | grep '^\?' | sed -e 's/\?[ ]*/svn add /g' | sh" 
# ignoreも含めてstatus確認。
alias svnst="svn st --no-ignore"
# バージョン管理下の属性を一覧表示
alias svnpl="svn proplist -Rv"


# export PS1="[\u@\h \W]\$(__git_ps1) \$ "
export PS1='[\u@\h \W$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '
