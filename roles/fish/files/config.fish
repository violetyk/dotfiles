set -x LANG ja_JP.UTF-8
set -x EDITOR vi
set -x XDG_CONFIG_HOME ~/.config
set -x TERM xterm-256color

function fish_user_key_bindings
  bind \cs peco_select_ghq_look
  bind \cr peco_select_history
  bind \cb peco_select_git_checkout
end
