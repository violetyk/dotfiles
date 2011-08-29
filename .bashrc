# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'
alias rm='rm -i'
# svn に登録されていないファイルをまとめて svn add
alias svnadd="svn st | grep '^\?' | sed -e 's/\?[ ]*/svn add /g' | sh" 
# ignoreも含めてstatus確認。
alias svnst="svn st --no-ignore"
# バージョン管理下の属性を一覧表示
alias svnpl="svn proplist -Rv"
