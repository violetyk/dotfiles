set -x LANG ja_JP.UTF-8
set -x EDITOR vi
set -x XDG_CONFIG_HOME ~/.config
set -x TERM xterm-256color

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
  abbr --add 'ag' 'ag -S --stats'
  abbr --add 'agh' 'ag --hidden'
  abbr --add 'wget' 'wget --no-check-certificate'
  abbr --add 'grep' 'grep --color'
end

if test -d /Applications/MacVim.app
  alias 'vim' '/Applications/MacVim.app/Contents/MacOS/Vim'
  alias 'vi' 'vim'
end
