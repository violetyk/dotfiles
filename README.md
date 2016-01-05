dotfiles
========

```sh
sudo xcodebuild -license
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
```

```sh
git clone git@github.com:violetyk/dotfiles.git
cd dotfiles
ansible-playbook -i hosts site.yml
```

## 使っているもの

- Homebrew
- zsh(prezto)
- ctags
- ag
- vim
- git
- tig
- tmux
- ghq
- peco


## セットアップ

- setup/base.bash
- setup/mac.bash
- setup/vim.bash
- setup/zsh.zsh
