" vim:set ts=4 sts=2 sw=2 tw=0 ft=vim:

" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible

"----------------------------------------------------
" Vundle関連
"----------------------------------------------------
filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()

Bundle 'surround.vim'

"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" プラグインを有効にする
filetype indent plugin on

"<Leader>の設定
let mapleader = ","

" ヘルプファイルの検索順
set helplang=ja,en

" バッファを切替えてもundoの効力を失わない
set hidden

" 起動時のメッセージを表示しない
set shortmess+=I

"スクロール時の余白
set scrolloff=5

" splitしたときに下に出す。
set splitbelow

" vsplitしたときに右に出す。
set splitright

"----------------------------------------------------
" エンコーディング
"----------------------------------------------------
