#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# for file in $HOME/.{path,exports,aliases,functions,commonrc,local}; do
for file in $HOME/dotfiles/.{path,exports,aliases,functions,commonrc,local}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# git completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

# peco
if which peco > /dev/null; then
  for f ($HOME/.zsh/peco-sources/*) source "${f}"

  # keybind
  bindkey '^r' peco-select-history
  bindkey '^s' peco-ghq-look
  # bindkey '^f' peco-cdr
fi
