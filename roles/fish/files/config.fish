set -x LANG ja_JP.UTF-8
set -x EDITOR vim
set -x VISUAL vim
set -x XDG_CONFIG_HOME ~/.config

set -U fish_user_paths /usr/local/bin $fish_user_paths
# add local for local setting to ~/.config/fish/conf.d/local.fish

function fish_user_key_bindings
  bind \cs peco_select_ghq_look
  bind \cr peco_select_history
  bind \cb peco_select_git_checkout
  bind \cj peco_select_fd_edit
  bind \cg peco_select_fd_cd
end

if status --is-interactive
  set -g fish_user_abbreviations
  abbr --add 'rm' 'rm -i'
  abbr --add 'cp' 'cp -i'
  abbr --add 'lll' 'ls -alh'
  abbr --add 'h' 'history'
  abbr --add 'j' 'jobs'

  # ag
  abbr --add 'ag' 'ag -S --stats'
  abbr --add 'agh' 'ag --hidden'

  # wget
  abbr --add 'wget' 'wget --no-check-certificate'
  abbr --add 'grep' 'grep --color'

  # vmstat
  abbr --add 'vmstat' 'vmstat -S M'

  # date
  abbr --add 'ymd' "date +'%Y%m%d'"
  abbr --add 'ymdhis' "date +'%Y%m%d%H%I%S'"

  # mysql
  abbr --add 'mysql' "env EDITOR=\"vim -c ':set ft=sql'\" mysql --auto-rehash --pager='less -S'"

  # trim and pbcopy
  abbr --add 'trim_pbcopy' "tr -d '\n' | pbcopy"

  # recursively delete .DS_Store
  abbr --add 'cleanup' "find . -type f -name '*.DS_Store' -ls -delete"

  # reload
  abbr --add 'reload' 'exec $SHELL -l'
end

# ip
alias ip 'dig +short myip.opendns.com @resolver1.opendns.com'
funcsave ip

alias localip 'ipconfig getifaddr en0'
funcsave localip

alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
funcsave ips


# view HTTP traffic
alias sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
funcsave sniff

alias httpdump "sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
funcsave httpdump


# mac
alias finder_show_hidden_files "defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
funcsave finder_show_hidden_files 

alias finder_hide_hidden_files "defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
funcsave finder_hide_hidden_files 

alias desktop_hide "defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
funcsave desktop_hide

alias desktop_show "defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
funcsave desktop_show

alias kill_chrome "ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
funcsave kill_chrome

alias afk "/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
funcsave afk
