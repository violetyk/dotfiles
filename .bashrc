# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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
alias mysql="mysql --pager='less -S'"

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
