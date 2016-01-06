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

- packer
- develop_src
- vim
- zsh


## ansibleコマンドいろいろ

```sh
# シンタックスチェック
ansible-playbook -i hosts simple-playbook.yml --syntax-check

# タスクの一覧を確認
ansible-playbook -i hosts simple-playbook.yml --list-tasks

# dry-run
ansible-playbook -i hosts simple-playbook.yml --check

# 情報を集めるタスクの実行
ansible -i hosts localhost -m setup
```

## ansibleデバッグ

```yml
---
- name: rbenv versions
  command: rbenv versions
  register: r

- debug: var=r.stdout_lines
```

## ansible参考リンク
- [Ansible Note · yteraoka/ansible-tutorial Wiki](https://github.com/yteraoka/ansible-tutorial/wiki/Ansible-Note)
- [Module Index — Ansible Documentation](http://docs.ansible.com/ansible/modules_by_category.html)
- [lorin/ansible-quickref](https://github.com/lorin/ansible-quickref)

## セットアップ
- setup/base.bash
- setup/mac.bash
- setup/vim.bash
- setup/zsh.zsh
