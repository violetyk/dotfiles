dotfiles
========

開発環境の設定ファイルと構成ファイル


- [Ansible](http://www.ansible.com/)と[Homebrew](http://brew.sh/)で構成管理しています
- [Best Practices](http://docs.ansible.com/ansible/playbooks_best_practices.html)に沿ったディレクトリ構成にしています
- mac.ymlに記述した `role` らをローカルのMacに構成します
- 各 `role` の構成ファイルは `roles/` の各ディレクトリに対応します
- 例えば `vim` のセットアップのタスクは `roles/vim/tasks/main.yml` です
- `homebrew` でインストールするパッケージなどは `host_vars/localhost` にまとめて設定しています

## 使い方

MacにHomebrewをインストール

```sh
sudo xcodebuild -license
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
```

ansible-playbook実行

```sh
git clone git@github.com:violetyk/dotfiles.git
cd dotfiles
ansible-playbook -i hosts site.yml --ask-sudo-pass
```


## Ansible備忘録

### コマンドいろいろ

```sh
# シンタックスチェック
ansible-playbook -i hosts simple-playbook.yml --syntax-check

# タスクの一覧を確認
ansible-playbook -i hosts simple-playbook.yml --list-tasks

# dry-run
ansible-playbook -i hosts simple-playbook.yml --check

# ホストの情報を集めるタスクを実行して確認
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
- [Module Index — Ansible Documentation](http://docs.ansible.com/ansible/modules_by_category.html)
- [Ansible Note · yteraoka/ansible-tutorial Wiki](https://github.com/yteraoka/ansible-tutorial/wiki/Ansible-Note)
- [lorin/ansible-quickref](https://github.com/lorin/ansible-quickref)

### [Best Practices](http://docs.ansible.com/ansible/playbooks_best_practices.html) 構成のジェネレータ
- [violetyk/ansible-skel](https://github.com/violetyk/ansible-skel)
