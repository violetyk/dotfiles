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
ansible-playbook -i hosts site.yml --ask-sudo-pass
```


## ansible

### コマンドいろいろ

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

### デバッグ

```yml
---
- name: rbenv versions
  command: rbenv versions
  register: r

- debug: var=r.stdout_lines
```

### 参考リンク
- [Ansible Note · yteraoka/ansible-tutorial Wiki](https://github.com/yteraoka/ansible-tutorial/wiki/Ansible-Note)
- [Module Index — Ansible Documentation](http://docs.ansible.com/ansible/modules_by_category.html)
- [lorin/ansible-quickref](https://github.com/lorin/ansible-quickref)
