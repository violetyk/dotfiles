# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

LANG=ja_JP.UTF-8
# LANG=en_US.utf8

### PATH
PATH=$PATH:$HOME/bin
CONFIGS=()


# OS別環境設定
if [ `uname` = "Linux" ]; then
  # for Linux
  PATH=$PATH:/usr/local/tmux/bin
  PATH=$PATH:/usr/local/ctags/bin
  PATH=$PATH:/usr/local/tig-1.0/bin
  
  alias vim='/usr/local/vim-7.4/bin/vim'
  alias vimdiff='/usr/local/vim-7.4/bin/vimdiff'

elif [ `uname` = "Darwin" ]; then
  # for Mac
  PATH=$PATH:/usr/local/tmux/bin
  PATH=$PATH:/usr/local/ctags/bin
  PATH=$PATH:/usr/local/tig-1.0/bin


  CONFIGS=(${CONFIGS[@]} '/usr/local/git/contrib/completion/git-prompt.sh')
  CONFIGS=(${CONFIGS[@]} '/usr/local/git/contrib/completion/git-completion.bash')
fi

export PATH
for CONFIG in ${CONFIGS[@]}; do
  if [ -e ${CONFIG} ]; then
    . ${CONFIG}
  fi
done



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
alias mysql="EDITOR=\"/usr/local/vim-7.4/bin/vim -c ':set ft=sql'\" mysql --auto-rehash"
# alias mysql="EDITOR=\"/usr/local/vim-7.3/bin/vim -c ':set ft=sql'\" mysql --auto-rehash --pager='less -S'"

### SVN
# svn に登録されていないファイルをまとめて svn add
alias svnadd="svn st | grep '^\?' | sed -e 's/\?[ ]*/svn add /g' | sh" 
# ignoreも含めてstatus確認。
alias svnst="svn st --no-ignore"
# バージョン管理下の属性を一覧表示
alias svnpl="svn proplist -Rv"

### Git
# gitのブランチの情報をプロンプトに表示させておく
# export PS1="[\u@\h \W]\$(__git_ps1) \$ "
export PS1='[\u@\h \W$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '

# SSH
_ssh() {
  tmp=$(mktemp XXXXXX)
  cat ~/dotfiles/.sshconfig ~/.ssh/config > "$tmp" 2>/dev/null
  /usr/bin/ssh -F "$tmp" "$@"
  rm -f "$tmp"
}
alias ssh='_ssh'

### function
# mkdir + cd
mkdircd(){
  mkdir -p $1 && cd $1
}

# Get list from file. The line of # is comment the top.
list(){
  LIST=''
  for ITEM in `cat $1 | grep -v "^#"`
  do
    if [ -e $ITEM ] ; then
      LIST="$LIST $ITEM"
    fi
  done

  echo $LIST
}
