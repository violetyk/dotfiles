" vim:set ts=4 sts=2 sw=2 tw=0 ft=vim fdm=marker:

set nocompatible

" Plugins {{{
let g:dein#install_max_processes = 48
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END
command! -nargs=0 PluginUpdate call dein#update()

let s:plugin_dir = expand('~/.vim/bundle/')
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

call dein#begin(s:plugin_dir)

if dein#load_cache()
  " base
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {
        \ 'build': {
        \     'mac': 'make -f make_mac.mak',
        \     'linux': 'make',
        \     'unix': 'gmake',
        \    },
        \ })
  call dein#add('vim-jp/vimdoc-ja')
  call dein#add('Shougo/neocomplete.vim', {
        \ 'if' : has('lua')
        \ })
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neossh.vim')
  call dein#add('kana/vim-gf-user')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-metarw')
  call dein#add('mattn/webapi-vim')
  call dein#add('vim-jp/vital.vim')
  call dein#add('thinca/vim-ref')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-localrc')

  " unite
  call dein#add('Shougo/unite.vim')
  call dein#add('ujihisa/unite-colorscheme', {'depends' : 'Shougo/unite.vim'})
  call dein#add('ujihisa/unite-locate', {'depends' : 'Shougo/unite.vim'})
  call dein#add('tacroe/unite-mark', {'depends' : 'Shougo/unite.vim'})
  call dein#add('zhaocai/unite-scriptnames', {'depends' : 'Shougo/unite.vim'})
  call dein#add('thinca/vim-editvar', {'depends' : 'Shougo/unite.vim'})
  call dein#add('thinca/vim-unite-history', {'depends' : 'Shougo/unite.vim'})
  call dein#add('ujihisa/unite-launch', {'depends' : 'Shougo/unite.vim'})
  call dein#add('Shougo/neomru.vim', {'depends' : 'Shougo/unite.vim'})
  call dein#add('tsukkee/unite-tag', {'depends' : 'Shougo/unite.vim'})
  call dein#add('sorah/unite-ghq', {'depends' : 'Shougo/unite.vim'})

  " editing
  call dein#add('vim-scripts/matchit.zip')
  call dein#add('vim-scripts/Align')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('mattn/emmet-vim')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-endwise')
  call dein#add('vim-scripts/Modeliner')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('kana/vim-smartchr', {'lazy' : 1})
  call dein#add('kana/vim-smartinput', {'lazy' : 1})
  call dein#add('osyo-manga/vim-over')

  " text objects
  call dein#add('akiyan/vim-textobj-php')
  call dein#add('akiyan/vim-textobj-xml-attribute')
  call dein#add('rhysd/vim-textobj-ruby')

  " filer
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/vimfiler', {'lazy' : 1})

  " outliner
  call dein#add('majutsushi/tagbar')
  call dein#add('vim-php/tagbar-phpctags.vim')

  " database
  call dein#add('vim-scripts/dbext.vim')
  call dein#add('vim-scripts/SQLUtilities')

  " navigation
  call dein#add('sgur/vim-gf-autoload')
  call dein#add('t9md/vim-choosewin')

  " sign
  call dein#add('nathanaelkane/vim-indent-guides', {'lazy' : 1})
  call dein#add('airblade/vim-gitgutter', {'lazy' : 1})

  " search
  call dein#add('osyo-manga/vim-anzu')
  call dein#add('rking/ag.vim')

  " git
  call dein#add('tpope/vim-fugitive')
  call dein#add('jaxbot/github-issues.vim', {'lazy' : 1})
  call dein#add('moznion/github-commit-comment.vim', {'lazy' : 1})
  call dein#add('rhysd/github-complete.vim')
  call dein#add('tyru/open-browser-github.vim')
  call dein#add('tyru/open-browser.vim')
  call dein#add('takahirojin/gbr.vim')

  " Vim script
  call dein#add('thinca/vim-prettyprint', {'on_ft' : 'vim'})

  " php
  call dein#add('joonty/vdebug', {'lazy' : 1, 'on_ft' : 'php'})

  " ruby
  call dein#add('vim-ruby/vim-ruby', {'on_ft' : 'ruby'})
  call dein#add('tpope/vim-rails', {'on_ft' : 'ruby'})
  call dein#add('tpope/vim-bundler', {'on_ft' : 'ruby'})
  call dein#add('tpope/vim-rake', {'on_ft' : 'ruby'})
  call dein#add('slim-template/vim-slim.git', {'on_ft' : 'slim'})
  call dein#add('tpope/vim-dispatch', {'on_ft' : 'ruby'})
  call dein#add('thoughtbot/vim-rspec', {'on_ft' : 'ruby'})

  " golang
  call dein#add('vim-jp/vim-go-extra', {'on_ft' : 'go'})
  call dein#add('dgryski/vim-godef', {
        \ 'on_ft' : 'go',
        \ 'rtp' : $GOPATH . '/src/github.com/nsf/gocode/vim'
        \ })

  " toml
  call dein#add('cespare/vim-toml',  {'on_ft' : 'toml'})

  " markdown
  call dein#add('godlygeek/tabular', {'on_ft' : ['markdown', 'md']})
  call dein#add('kannokanno/previm', {'on_ft' : ['markdown', 'md']})
  call dein#add('jszakmeister/markdown2ctags', {'rtp': ''})

  " javascript
  call dein#add('marijnh/tern_for_vim', {'on_ft' : 'javascript'})
  call dein#add('pangloss/vim-javascript', {'on_ft' : 'javascript'})

  " coffee
  call dein#add('kchmck/vim-coffee-script', {'on_ft' : 'coffee'})

  " typescript
  call dein#add('leafgarland/typescript-vim', {'on_ft' : 'typescript'})
  call dein#add('clausreinke/typescript-tools', {'on_ft' : 'typescript'})

  " python
  call dein#add('davidhalter/jedi-vim', {'lazy' : 1, 'on_ft' : 'python'})
  call dein#add('sophacles/vim-bundle-mako', {'on_ft' : 'mako'})
  call dein#add('hynek/vim-python-pep8-indent', {'on_ft' : 'python'})

  " syntax checking
  call dein#add('scrooloose/syntastic')

  " statusline
  call dein#add('itchyny/lightline.vim')

  " colorscheme
  call dein#add('mrkn/mrkn256.vim')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('tomasr/molokai')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('chriskempson/tomorrow-theme', {
        \ 'rtp': s:plugin_dir . 'repos/github.com/chriskempson/tomorrow-theme/vim/',
        \ })
  call dein#add('jpo/vim-railscasts-theme')
  call dein#add('vim-scripts/pyte')
  call dein#add('cocopon/iceberg.vim')

  " syntax
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('osyo-manga/vim-precious', {
        \ 'depends' : ['Shougo/context_filetype.vim', 'kana/vim-textobj-user']
        \ })
  " call dein#add('jelera/vim-javascript-syntax')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('elzr/vim-json')
  call dein#add('vim-scripts/nginx.vim')

  " gist
  call dein#add('mattn/gist-vim')
  call dein#add('lambdalisue/vim-gista')

  " system
  call dein#add('mopp/autodirmake.vim')

  " local
  call dein#local('~/src/github.com/violetyk',
        \ {
        \   'frozen' : 1,
        \   'depends' : [
        \     'kana/vim-gf-user',
        \     'Shougo/neosnippet.vim',
        \     'vim-jp/vital.vim'
        \   ]
        \ },
        \ [
        \   '*.vim',
        \   'neosnippet-*',
        \   'neocomplete-*',
        \   'scratch-utility'
        \ ])
  call dein#local('~/src/github.com/violetyk/lab',
        \ {
        \   'frozen' : 1,
        \   'depends' : [
        \     'kana/vim-gf-user',
        \     'Shougo/neosnippet.vim',
        \     'vim-jp/vital.vim'
        \   ]
        \ },
        \ [
        \   '*.vim'
        \ ])

  call dein#save_cache()
endif

call dein#end()
filetype plugin indent on
" }}}

" 基本的な設定: {{{

" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"<Leader>の設定
let mapleader = ","

" 日本語ヘルプフリーズ問題対策。
set notagbsearch

" ヘルプファイルの検索順
set helplang=ja,en

" 保存していないバッファでも切り替えられる
set hidden

" 起動時のメッセージを表示しない
set shortmess+=I

"スクロール時の余白
set scrolloff=5

" splitしたときに下に出す。
set splitbelow

" vsplitしたときに右に出す。
set splitright

" 補完時、現在選択中の候補の付加情報を表示しない。
set completeopt-=menu,preview

" 正規表現エンジンの設定
" set regexpengine=0

" pasteモードの切り替えマッピング
set pastetoggle=<C-p>
" }}}

" マウスの設定: {{{
set mouse=
" }}}

" 文字コードの設定 {{{

" Vim内部で使われる文字エンコーディング
set encoding=utf-8

" ターミナルで使われるエンコーディング
set termencoding=utf-8

" カレントバッファのファイルの文字エンコーディング
set fileencoding=utf-8

" 読めなかったときに試される順番。
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,sjis

" 改行コードの自動認識
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
" set ambiwidth=single

" }}}

" バックアップ・スワップの設定 {{{

" バックアップをとらない
set nobackup

" ファイルの上書きの前にバックアップを作る
" (backup がオフの場合、バックアップは上書きに成功した後削除される)
" set writebackup

" バックアップを作成しないファイルパターン
" set backupskip = escape(expand('$HOME'), '\') . '/tmp/*'

" バックアップ名の最後に文字列を追加
augroup Backup
  autocmd!
  autocmd BufWritePre * let &backupext = '-' . strftime("%Y%m%d_%H%M")
augroup END

" バックアップファイルを作るディレクトリ
if has('win32') || has('win64')
  set backupdir=$VIM/backup
else
  set backupdir=$HOME/backup
endif

" スワップファイルをつくる
set swapfile

" スワップファイルを作るディレクトリ
if has('win32') || has('win64')
  set directory=$VIM/swap
else
  set directory=$HOME/swap
endif
" スワップファイルの更新間隔文字数
set updatecount=500

" }}}

" アンドゥ/リドゥの設定 {{{
" set undofile
" set undodir=$HOME/undo
" }}}

" クリップボードの設定 {{{
" クリップボードの共有
set clipboard+=unnamedplus,unnamed
" }}}

" colorscheme {{{

" 補完の色を変更
" hi Pmenu ctermfg=Black ctermbg=Grey
" hi PmenuSel ctermbg=Blue
" hi PmenuSbar ctermbg=Cyan

" 対応する括弧の色を控えめにしておく
" hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black

  silent! colorscheme jellybeans
" }}}

" ハイライトの設定 {{{

" 色のチェック方法
" :so $VIMRUNTIME/syntax/colortest.vim


" 全角スペースのハイライト
function! s:highlight_zenkaku_space()
  " エラーと同じ色
  highlight link ZenkakuSpace Error
  "highlight ZenkakuSpace cterm=underline ctermfg=red guibg=red

  "全角スペースを明示的に表示する。
  silent! match ZenkakuSpace /　/
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter,WinEnter * nested call <SID>highlight_zenkaku_space()
  augroup END
endif

" }}}

" 検索・補完の設定 {{{

" コマンド、検索パターンをn個まで履歴に残す
set history=500

" 検索の時に大文字小文字を区別しない
set ignorecase

" 検索altercation / solarized の時に大文字が含まれている場合は区別して検索する
set smartcase

" 最後altercation / solarized まで検索したら先頭に戻る
set wrapscan

" インクリメンタルサーチの使用
"set noincsearch
set incsearch

" コマンドライン補完を拡張モードにする
set wildmenu

" 複数のマッチがあるときは、全てのマッチを羅列する。
set wildmode=full

" コマンドラインの補完キー
set wildchar=<Tab>

set showfulltag
" }}}

" 画面表示の設定 {{{

" タイトルをウインドウ枠に表示する
set title

" 行番号を表示
set number

" ルーラーを表示
"set ruler

" タブ文字を CTRL-I（デフォルト） で表示し、行末に $ で表示する
set list
" タブ文字を次の文字列で視覚化(Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
" cが一文字で、xyが2文字。
" eol:c     行末の改行文字
" tab:c     タブ
" trail:xy  行末のスペース
" extends:c 折り返した行の表末
" precedes:c 折り返してきた表の行頭
" nbsp:c    ノンブレーカブルスペース（？）
set listchars=tab:>-,extends:<,trail:-

" 括弧入力時の対応する括弧を表示
set showmatch

" 対応する括弧の表示時間を2にする
set matchtime=2

" シンタックスハイライトを有効にする
syntax on

" 検索結果文字列のハイライトを有効にする
set hlsearch

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0

" ウィンドウの幅より長い行でも折り返さない
set nowrap

" カーソルラインを表示させる
" set cursorline
" カーソル列を表示させる
" set cursorcolumn

" マクロ/レジスタの内容/キーボードから打ち込まれないコマンド を実行する管は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

" }}}

" ステータスラインの設定 {{{

" 入力中のコマンドをステータスに表示する
set showcmd

" ステータスラインを常に表示
set laststatus=2

" ステータスラインの行数
set cmdheight=2

" ステータスラインに表示する情報の指定
" set statusline=%n\:%y%F\ %m%r%=%{fugitive#statusline()}[%{(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%l/%L(%p%%),%v]

" }}}

" 共通のインデントの設定(ファイルタイプ別はafter/ftplugin/xxx.vimにて設定) {{{

" オートインデントを無効にする
"set noautoindent

" タブが対応する空白の数
set tabstop=2

" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2

" インデントの各段階に使われる空白の数
set shiftwidth=2

" タブはハードタブとして入力する
" set noexpandtab
" タブは空白として入力する（実際にTABを入力したい場合は<C-V><TAB>）
set expandtab

" }}}

" 共通オートコマンド {{{

augroup MyAutoCommands
  autocmd!

  " カーソル位置を記憶する
  autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal g`\"" |
     \ endif

  " javascript って打つのがめんどくさいので js にする
  autocmd FileType js setlocal ft=javascript

  " :vimgrep や :makeしたときに自動的にQuickFixを開く
  " autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

  " ウィンドウを移動する度に外部で変更のあったファイルを自動的に読み直す
  " 関連：autoread
  autocmd WinEnter * checktime

augroup END

" }}}

" コマンド {{{

" 戦闘力を計測
function! s:scouter(file, ...) " {{{
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction " }}}
command! -bar -bang -nargs=? -complete=file Scouter echo <SID>scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)

" cdpathからcdする
function! CompleteCD(arglead, cmdline, cursorpos) " {{{
  let pattern = join(split(a:cmdline, '\s', !0)[1:], '') . '*/'
  return split(globpath(&cdpath, pattern), "\n")
endfunction " }}}
command! -complete=customlist,CompleteCD -nargs=? CD cd <args>

" コマンドラインの時だけcdをCDとして略語展開
cnoreabbrev <expr> cd
      \ (getcmdtype() == ':' && getcmdline() ==# 'cd') ? 'CD' : 'cd'


" ファイル名やパスなどのヤンク
function! s:yank_file_name() "{{{
  let @" = expand("%:t")
endfunction "}}}
command! -nargs=0 Yankfilename call s:yank_file_name() | echo printf('yank: %s', @")
function! s:yank_file_path() "{{{
  let @" = expand("%:p")
endfunction "}}}
command! -nargs=0 Yankfilepath call s:yank_file_path() | echo printf('yank: %s', @")

" 行末の文字が引数の1文字かどうか
function! s:is_endof_line(char) " {{{
  return getline(".")[col("$")-2] == a:char
endfunction " }}}

" historyを読み込む
function! s:BashHistory(...) " {{{
  if a:0 == 1
    let limit = a:1
  else
    let limit = ''
  endif
  let cmd = 'echo ''history ' . limit . ''' | bash -i 2>/dev/null | sed -e ''s/.*\x07//g'' | awk ''{ $1=""; print $0}'''
  silent exec ':r !' . cmd
endfunction " }}}
command! -nargs=? BashHistory :call s:BashHistory(<f-args>)

function! s:Copy() range " {{{
  let l:tmp = @@
  silent normal gvy
  let l:selected = @@
  let b64 = webapi#base64#b64encode(l:selected)
  if $TMUX != ""
    let cmd = printf('printf "\x1bPtmux;\x1b\x1b]52;;%s\x1b\x1b\\\\\x1b\\" > /dev/tty', b64)
  elseif $TERM == "screen"
    let cmd = printf('printf "\x1bP\x1b]52;;%s\x07\x1b\\" > /dev/tty', b64)
  else
    let cmd = printf('printf "\x1b]52;;%s\x1b\\" > /dev/tty', b64)
  endif
  call system(cmd)
  redraw!
  let @@ = l:tmp
endfunction " }}}
command! -range Copy :call s:Copy()

" アプリケーションでファイルを開く
function! s:open_file_in(app, file)
  let f = len(a:file) > 0 ? fnamemodify(a:file, ':p') : expand('%:p')
  if has("win32") || has("win64")
    silent exec "!start cmd /c call " . a:app . " " . shellescape(f)
  else
    silent exec "!" . a:app . " " . shellescape(f) " &"
  endif
endfunction
command! -nargs=? -complete=file OpenAtom call s:open_file_in('atom', <q-args>)

" }}}

" keybindの設定 {{{

"   ユーザ設定
"   map
"
"   デフォルト設定
"   map!
"
"   調べる方法。
"   :map
"
"   それぞれのモードだけ表示。
"   :nmap
"   :imap
"   :vmap
"
"   ショートカットキーの定義元ファイル情報も表示。
"   :verbose nmap
"
" |------------------|----------|----------|-----------|----------|
" | mode             | normal   | insert   | command   | visual   |
" |------------------|----------|----------|-----------|----------|
" | map / noremap    | yes      | no       | no        | yes      |
" | nmap / nnoremap  | yes      | no       | no        | no       |
" | imap / inoremap  | no       | yes      | no        | no       |
" | cmap / cnoremap  | no       | no       | yes       | no       |
" | vmap / vnoremap  | no       | no       | no        | yes      |
" | map! / noremap!  | no       | yes      | yes       | no       |
" |------------------|----------|----------|-----------|----------|


" 移動操作 {{{
nnoremap <silent>bf :bf<CR>
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bl :bl<CR>
nnoremap <silent>bb :b#<CR>
nnoremap <silent>bm :bm<CR>
nnoremap <silent>bd :bdelete<CR>
nnoremap <silent>bs :split #<CR>
nnoremap <silent>bv :vsplit #<CR>
nnoremap <silent>bt :tabedit #<CR>

" 分割幅を広く
map <PageUp> 3<C-w>+
" 分割幅を狭く
map <PageDown> 3<C-w>-

" 分割ウィンドウに移動して大きくする
" noremap <C-j> <C-w>j<C-w>_
" noremap <C-k> <C-w>k<C-w>_

noremap <C-j> :<C-u>cnext<CR>
noremap <C-k> :<C-u>cprevious<CR>

" Ctrl+Nで次のバッファを表示
" map <silent> <C-N> :bnext<CR>
" Ctrl+Pで前のバッファを表示
" map <silent> <C-P> :bprevious<CR>

" タブ移動
nnoremap gl gt
nnoremap gh gT

" 行の先頭、末尾移動
noremap <Space>h ^
noremap <Space>l $

" 縦分割版gf
nnoremap gs :vertical wincmd f<CR>

" タグジャンプで複数ある時は一覧表示
nnoremap <C-]> g<C-]><Space>


" 移動量の調節
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
" }}}

" 検索操作 {{{

" ハイライトを消す。
noremap <silent> <Esc><Esc> :<C-u>set nohlsearch<Return>

" 新しく別の単語を検索するときだけハイライトして、nやNでの移動はハイライトしたくない
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" ビジュアルモードで選択した範囲を検索
vnoremap z/ <ESC>/\%V
vnoremap z? <ESC>?\%V

" 検索時に/をエスケープ
cnoremap <expr>/ getcmdtype() == '/' ? '\/' : '/'

" }}}

" 編集操作 {{{

" ～まで、を少し便利にする。
onoremap ) t)
onoremap ( t(
onoremap ; t;
onoremap , t,
vnoremap ) t)
vnoremap ( t(
vnoremap ; t;
vnoremap , t,

" 貼り付けの後「=」でフォーマッティングは面倒なので、いつでもカレント行のインデントにあわせた貼り付けをする。
nnoremap p ]p
nnoremap P ]P

" カーソル位置の単語を置換 s* と打鍵してから置き換え文字を打って /g エンターで発動。
if dein#is_sourced('vim-over')
  nnoremap <expr> s* ':<C-u>OverCommandLine %s/\<' . expand('<cword>') . '\>/<CR>'
  vnoremap <expr> s ":<C-u>OverCommandLine '<,'>s/<CR>"
else
  nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'
endif

" レジスタやマークを確認しやすくする。
nnoremap <Space>m :<C-u>marks<Space>
nnoremap <Space>r :<C-u>registers<Space>

" 行末に;を追加する。
inoremap <expr>;; <SID>is_endof_line(";") ? "<C-O>$" : "<C-O>$;"
nnoremap <expr>;; <SID>is_endof_line(";") ? "$" : "$a;<Esc>"

" 行末に,を追加する。
inoremap <expr>,, <SID>is_endof_line(";") ? "<C-O>$" : "<C-O>$,"
nnoremap <expr>,, <SID>is_endof_line(";") ? "$" : "$a,<Esc>"


" 最後に編集したテキストを選択。
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>

" 行末までヤンク
nnoremap Y y$

" w!! でsudoしつつ保存
cmap w!! w !sudo tee > /dev/null %


" }}}

" その他 {{{

" ヘルプを引きやすくする
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

" ev / eg ですぐに.vimrcを開けるようにする。rv / rg で反映させる。
nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>

" }}}

"}}}

" プラグインの設定 {{{

if dein#is_sourced('nerdcommenter') " {{{
  "未対応ファイルタイプのエラーメッセージを表示しない
  let NERDShutUp=1
  " /**/をスペース空けて/* */
  let NERDSpaceDelims = 1
endif " }}}
if dein#is_sourced('nerdtree') " {{{
  " カラー表示するか
  let NERDChristmasTree = 1
  " 起動時に隠しファイルを表示するか（あとで切り替えられる）
  let NERDTreeShowHidden = 0
  " カーソル行を強調する場合1
  let NERDTreeHighlightCursorline = 1
  " NERDTreeウィンドウのサイズ
  let NERDTreeWinSize = 30
  " NERDTreeウィンドウを横に表示するか上に表示するか
  let NERDTreeWinPos = "left"

  nnoremap <silent> <Leader>e :<C-u>NERDTreeToggle<CR>
  nnoremap <silent> <Leader>f :<C-u>NERDTreeFind<CR>

  let NERDTreeHijackNetrw = 0
  let NERDTreeAutoCenter = 0
endif " }}}
if dein#is_sourced('vimfiler') " {{{
  let g:vimfiler_as_default_explorer=1
  nnoremap <silent> <Leader>e :<C-u>VimFiler -split -toggle -simple -winwidth=30 -no-quit -project -create<CR>
  nnoremap <silent> <Leader>f :<C-u>VimFilerBuffer -split -toggle -simple -winwidth=30 -no-quit -project -create<CR>
endif " }}}
if dein#is_sourced('taglist.vim') " {{{
  let Tlist_Ctags_Cmd = "ctags"

  let Tlist_Inc_Winwidth = 1
  "taglistのウィンドウが最後のウィンドーならばVimを閉じる
  let Tlist_Exit_OnlyWindow = 1
  " Do not close tags for other files
  let Tlist_File_Fold_Auto_Close = 1
  let Tlist_Process_File_Always = 1
  " Do not show folding tree
  let Tlist_Enable_Fold_Column = 0
  " 現在編集中のソースのタグしか表示しない
  let Tlist_Show_One_File = 1
  " 左右分割ではなく上下分割を使う。
  let Tlist_Use_Horiz_Window = 0
  let Tlist_WinHeight = 10
  " 左右分割の時に右側にだす
  let Tlist_Use_Right_Window = 1
  let Tlist_WinWidth = 40

  " Sort by the order
  let Tlist_Sort_Type = "order"
  " Do not display the help info
  let Tlist_Compact_Format = 1

  let g:Tlist_php_settings = 'php;c:class;f:function'

  " nnoremap <silent> <Leader>t :TlistOpen<CR>

  " ~/.ctags に設定を書くことにした。
  " --langmapは次のように調べられる。
  " $ ctags --list-maps
  " PHP      *.php *.php3 *.phtml

  " --php-typesは次のように調べられる。
  " $ ctags --list-kinds=php
  " c  classes
  " i  interfaces
  " d  constant definitions
  " f  functions
  " v  variables
  " j  javascript functions

  nmap <silent> <F12> :!ctags -R -f %:p:h/tags ./<CR>
  if has('path_extra')

    " 現ディレクトリ含む親ディレクトリをさかのぼってtagsファイルを指定
    " set tags=tags;

    " 上だとルートまでさかのぼっちゃうので;以降に特定のディレクトリを指定して、さかのぼり上限を設定。
    " set tags+=tags;$HOME
    set tags=tags;$HOME,$HOME/tags/*.tags

    " 現在のディレクトリからした全てのtagsを読み込む。
    " set tags=./**/tags;

    " **は30階層が上限なので、上記だと処理が重くなる可能性がある。階層の深さの上限を指定するやりかた。
    " set " tags=./**3/tags;

    " 現在のディレクトリから上はルート、下は全部さかのぼってtagsファイルを読み込む。
    " set " tags=**;
  else
    set tags=./tags,tags
  endif
endif " }}}
if dein#is_sourced('neocomplete.vim') " {{{
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  let g:neocomplete#max_list = 30
  let g:neocomplete#sources#buffer#max_keyword_width = 100

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " completion patterns
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns= {}
  endif
  let g:neocomplete#delimiter_patterns.vim = ['#']
  let g:neocomplete#delimiter_patterns.ruby = ['::']

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.go = '\h\w*\.\?'
  " let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'


  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplete#enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplete#enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  augroup PluginNeoComplete
    autocmd!

    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    if dein#is_sourced('jedi.vim')
      autocmd FileType python setlocal omnifunc=jedi#completions
    else
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    endif
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType gitcommit setlocal omnifunc=github_complete#complete
    " autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType php setlocal omnifunc=
  augroup END

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

  let g:neocomplete#force_overwrite_completefunc = 1
endif " }}}

if dein#is_sourced('neosnippet') " {{{

  function! s:setup_neosnippets()
    if exists('b:rails_root')
      let dirs = [
            \ $HOME.'/src/github.com/violetyk/neosnippet-rails/neosnippets',
            \]
      nnoremap <buffer><silent><expr> <Space>es ':NeoSnippetEdit -split -vertical ' . &filetype . '/'. RailsFileType()
    elseif index(['php', 'ctp'], &filetype) != -1
      let dirs = [
            \ $HOME.'/src/github.com/violetyk/neosnippet-cakephp2/neosnippets',
            \]
      nnoremap <buffer><silent> <Space>es :NeoSnippetEdit -split -vertical<space>
    else
      let dirs = [
            \ $HOME.'/.vim/bundle/neosnippet-snippets/neosnippets'
            \]
      nnoremap <buffer><silent><expr> <Space>es ':NeoSnippetEdit -split -vertical ' . &filetype . '.snip'
    endif

    let g:neosnippet#snippets_directory = dirs
  endfunction

  augroup neosnippet_set_directory
    autocmd!
    autocmd BufEnter * call s:setup_neosnippets()
  augroup END

  nnoremap <silent> <Space>rs  :<C-u>NeoSnippetSource<Space>


  " Plugin key-mappings.
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  xmap <C-l> <Plug>(neosnippet_start_unite_snippet_target)

  " For snippet_complete marker.
  " if has('conceal')
    " set conceallevel=2 concealcursor=i
  " endif
endif " }}}
if dein#is_sourced('unite.vim') " {{{
  " To track long mru history.
  let g:unite_source_file_mru_long_limit = 3000
  let g:unite_source_directory_mru_long_limit = 3000
  let g:unite_prompt = '» '

  let g:unite_source_history_yank_enable = 1
  let g:unite_source_tag_max_name_length  = 30
  let g:unite_source_tag_max_fname_length = 150


  function! s:unite_my_settings()
    " Overwrite settings.

    nmap <buffer> <ESC>    <Plug>(unite_exit)
    imap <buffer> jj       <Plug>(unite_insert_leave)

    imap <buffer><expr> j  unite#smart_map('j', '')
    imap <buffer> <TAB>    <Plug>(unite_select_next_line)
    imap <buffer> <C-w>    <Plug>(unite_delete_backward_path)
    imap <buffer> '        <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x  unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x        <Plug>(unite_quick_match_choose_action)
    imap <buffer> <C-z>    <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>    <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>    <Plug>(unite_narrowing_path)
    nmap <buffer> <C-j>    <Plug>(unite_toggle_auto_preview)
    imap <buffer> <C-r>    <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> a unite#smart_map('a', unite#do_action('above'))
    nnoremap <silent><buffer><expr> b unite#smart_map('b', unite#do_action('below'))
    nnoremap <silent><buffer><expr> l unite#smart_map('l', unite#do_action('left'))
    nnoremap <silent><buffer><expr> r unite#smart_map('r', unite#do_action('right'))
    nnoremap <silent><buffer><expr> t unite#smart_map('t', unite#do_action('tabsplit'))
    nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))

    " let unite = unite#get_current_unite()
    " if unite.buffer_name =~# '^search'
      " nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    " else
      " nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    " endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
          \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
  endfunction

  augroup PluginUnite
    autocmd!
    autocmd FileType unite call s:unite_my_settings()
    autocmd BufEnter *
          \   if empty(&buftype)
          \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
          \|  endif
  augroup END


  nnoremap [unite] :<C-u>Unite<Space>
  nmap f [unite]

  nnoremap [unite]A   :<C-u>Unite output:autocmd<CR>
  nnoremap [unite]b   :<C-u>Unite bookmark<CR>
  nnoremap [unite]c   :<C-u>Unite cake_controller cake_model cake_config cake_component cake_behavior cake_helper cake_shell cake_fixture cake_core cake_lib n_class -start-insert<CR>
  nnoremap [unite]C   :<C-u>Unite change<CR>
  nnoremap [unite]d   :<C-u>UniteWithBufferDir -buffer-name=files file -start-insert<CR>
  nnoremap [unite]e   :<C-u>Unite output:echo\ system('set')<CR>
  nnoremap [unite]f   :<C-u>UniteWithInputDirectory file_rec/async -start-insert<CR>

  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command = ['ag', '-S', '--follow', '--nocolor', '--nogroup', '--ignore-dir', '.vagrant', '-g', '']
  " let g:unite_source_grep_max_candidates = 200
    nnoremap [unite]g   :<C-u>Unite -no-quit grep<CR>
    nnoremap [unite]G   :<C-u>Unite -no-quit grep<CR><CR><C-r><C-w><CR>
  else
    nnoremap [unite]g   :<C-u>Unite -no-quit grep<CR>
  endif

  " nnoremap [unite]h   :<C-u>Unite history/command<CR>
  nnoremap [unite]j   :<C-u>Unite buffer file_mru bookmark -start-insert<CR>
  nnoremap [unite]J   :<C-u>Unite jump<CR>
  " nnoremap [unite]l   :<C-u>Unite locate -start-insert<CR>
  nnoremap [unite]l   :<C-u>Unite line -start-insert<CR>
  nnoremap [unite]L   :<C-u>UniteWithCursorWord line -start-insert -auto-preview<CR>
  " nnoremap [unite]L   :<C-u>Unite launcher<CR>
  nnoremap [unite]M   :<C-u>Unite output:messages<CR>
  " nnoremap [unite]M   :<C-u>Unite mapping -start-insert<CR>
  " nnoremap [unite]o   :<C-u>Unite outline -buffer-name=outline -vertical -winwidth=45 -no-quit<CR>
  " nnoremap [unite]o   :<C-u>Unite -buffer-name=outline -auto-preview -vertical -no-quit outline<CR>
  " nnoremap [unite]p   :<C-u>Unite process -start-insert<CR>
  nnoremap [unite]p   :<C-u>Unite file_rec/async:! -start-insert<CR>
  " nnoremap [unite]q   :<C-u>Unite qfixhowm:nocache<CR>
  " nnoremap [unite]r   :<C-u>Unite ref/phpmanual -start-insert<CR>
  " nnoremap [unite]r   :<C-u>Unite ref/refe -start-insert -default-action=tabopen<CR>
  nnoremap [unite]r   :<C-u>Unite -buffer-name=register register<CR>
  nnoremap [unite]R   :<C-u>UniteWithCursorWord ref/refe -start-insert -default-action=tabopen<CR>
  nnoremap [unite].   :<C-u>UniteResume<CR>
  nnoremap [unite]/   :<C-u>Unite history/search -start-insert<CR>
  nnoremap [unite]s   :<C-u>Unite ghq -start-insert<CR>
  nnoremap [unite]S   :<C-u>Unite output:scriptnames<CR>
  nnoremap [unite]t   :<C-u>Unite tag -start-insert<CR>
  " nnoremap [unite]v   :<C-u>Unite output:version -start-insert<CR>
  nnoremap [unite]v   :<C-u>Unite variable -auto-preview -start-insert<CR>

  nnoremap [unite]y   :<C-u>Unite history/yank -start-insert<CR>

endif " }}}
if dein#is_sourced('scratch-utility') " {{{
  nmap <silent> <Leader>b <Plug>ShowScratchBuffer

  " スクラッチバッファを開くマッピングを定義しない
  let no_plugin_maps = 1

  " vim終了時にスクラッチの内容を保存しておく。
  let g:scratchBackupFile=$HOME . "/scratch.txt"

  let g:scratchSplitOption =
        \ {
        \   'vertical'           : 1,
        \   'take_over_filetype' : 1
        \ }
endif "}}}
if dein#is_sourced('emmet.vim') " {{{
  " デフォルトは<C-Y>
  " let g:user_emmet_leader_key = '<C-Space>'

  " タグやスニペットの入力補完を使う
  let g:user_emmet_complete_tag = 1

  " filterについて -> http://code.google.com/p/zen-coding/wiki/Filters
  let g:user_emmet_settings = {
        \  'lang' : 'ja',
        \  'html' : {
        \    'filters' : 'html',
        \    'indentation' : ' '
        \  },
        \  'php' : {
        \    'extends' : 'html',
        \    'filters' : 'html,c',
        \  },
        \  'css' : {
        \    'filters' : 'fc',
        \  },
        \  'javascript' : {
        \    'snippets' : {
        \      'jq' : "$(function() {\n\t${cursor}${child}\n});",
        \      'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
        \      'fn' : "(function() {\n\t${cursor}\n})();",
        \      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
        \    },
        \  },
        \}
endif "}}}
if dein#is_sourced('cake.vim') " {{{
  let g:cakephp_gf_fallback_n = "normal \<Plug>(gf-user-gf)"
  let g:cakephp_gf_fallback_s = "normal \<Plug>(gf-user-\<C-w>f)"
  let g:cakephp_gf_fallback_t = "normal \<Plug>(gf-user-\<C-w>gf)"
  let g:cakephp_test_window_vertical = 1
  let g:cakephp_test_window_width = 70

  nnoremap <Space>cc :<C-u>Ccontroller
  nnoremap <Space>cm :<C-u>Cmodel
  nnoremap <Space>cv :<C-u>Cview
  nnoremap <Space>cl :<C-u>Clog
  nnoremap <Space>ccm :<C-u>Ccomponent
  nnoremap <Space>ccf :<C-u>Cconfig
  nnoremap <Space>cb :<C-u>Cbehavior
  nnoremap <Space>ch :<C-u>Chelper
  nnoremap <Space>ct :<C-u>Ctest
  nnoremap <Space>cf :<C-u>Cfixture
  nnoremap <Space>cs :<C-u>Cshell
  nnoremap <Space>cd :<C-u>Cdesc
  " nnoremap <Leader>t :<C-u>Ctestrunmethod<CR>

  " プロジェクト切り替えコマンド
  " let g:my_cakephp_projects = {
    " \ 'project' : '/path/to/app',
    " \ }
  let g:my_cakephp_projects = get(g:, 'my_cakephp_projects', {})
  command! -n=1  -complete=customlist,s:GetCakePHPProjectList C :call s:SetCakePHPProject(<f-args>)
  function! s:GetCakePHPProjectList(ArgLead, CmdLine, CursorPos) "{{{
    if exists("g:my_cakephp_projects") && len(g:my_cakephp_projects)
      return filter(sort(keys(g:my_cakephp_projects)), 'v:val =~ "^'. fnameescape(a:ArgLead) . '"')
    else
      return []
    endif
  endfunction "}}}

  " プロジェクト切り替え
  function! s:SetCakePHPProject(app) " {{{
    if isdirectory(g:my_cakephp_projects[a:app])
      silent exec ":Cakephp " . g:my_cakephp_projects[a:app]
      echo "CakePHP project changed: ". a:app
    endif
  endfunction " }}}

endif "}}}
if dein#is_sourced('vim-surround') " {{{
  let g:surround_{char2nr("p")} = "<?php \r ?>"
endif " }}}
if dein#is_sourced('Modeliner') " {{{
  let g:Modeliner_format='ft= et ff= fenc= sts= sw= ts='
endif " }}}
if dein#is_sourced('vim-fugitive') " {{{
  " nnoremap <Space>gd :<C-u>Gdiff<Enter>
  " nnoremap <Space>gs :<C-u>Gstatus<Enter>
  " nnoremap <Space>gl :<C-u>Glog<Enter>
  " nnoremap <Space>ga :<C-u>Gwrite<Enter>
  " nnoremap <Space>gc :<C-u>Gcommit<Enter>
  " nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
  " nnoremap <Space>gb :<C-u>Gblame<Enter>
endif " }}}
if dein#is_sourced('dbext.vim') " {{{
  " let g:dbext_default_profile_xxxx      = 'type=MYSQL:user=mysql:passwd=mysql:dbname=hoge:host=localhost:port=3306:buffer_lines=50'
  " let g:dbext_default_window_use_horiz = 0  " Use vertical split
  let g:dbext_default_window_use_horiz = 1  " Use horizontal split
  let g:dbext_default_window_use_bottom = 1  " Bottom
  " let g:dbext_default_window_use_bottom = 0  " Top
  " let g:dbext_default_window_use_right = 1   " Right
  " let g:dbext_default_window_use_right = 1   " Left
  let g:dbext_default_window_width = 100

  " 接続切り替えコマンド
  " let g:my_db_profiles = {
  "   \ 'table': 'type=MYSQL:user=mysqluser:passwd=mysqlpasswd:dbname=dbname:host=localhost:port=3306',
  "   \ }
  command! -n=1  -complete=customlist,s:GetDBProfileList DB :call s:ConnectDB(<f-args>)
  function! s:GetDBProfileList(ArgLead, CmdLine, CursorPos) "{{{
    return filter(sort(keys(g:my_db_profiles)), 'v:val =~ "^'. fnameescape(a:ArgLead) . '"')
  endfunction "}}}
  function! s:ConnectDB(profile)
    call dbext#DB_setMultipleOptions(g:my_db_profiles[a:profile])
    silent exec ":DBCompleteTables"
    silent exec ":DBCompleteProcedures"
    silent exec ":DBCompleteViews"
    echo "Connect Database : " . a:profile
  endfunction
endif " }}}
if dein#is_sourced('vim-localrc') " {{{
  " ディレクトリごとにvimの設定を用意するファイル名
  let g:localrc_filename = '.local.vimrc'
  silent! call localrc#load('.init.vimrc', $HOME)
endif " }}}
if dein#is_sourced('vim-indent-guides') " {{{
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
endif " }}}
if dein#is_sourced('vim-anzu') " {{{
  nmap n <Plug>(anzu-n)zv
  nmap N <Plug>(anzu-N)zv
  nmap * <Plug>(anzu-star)zv
  nmap # <Plug>(anzu-sharp)zv
  augroup PluginAuzu
    autocmd!
    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
  augroup END
endif " }}}
if dein#is_sourced('vim-precious') " {{{
  let g:precious_enable_switchers = {
        \ "*" : {
        \   "setfiletype" : 0
        \ },
        \ "markdown" : {
        \   "setfiletype" : 1
        \ },
        \}
endif " }}}
if dein#is_sourced('lightline.vim') " {{{
  let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ ['mode', 'paste'], ['fugitive', 'filename', 'cakephp', 'currenttag', 'anzu'] ]
        \ },
        \ 'component': {
        \   'lineinfo': '⭡ %3l:%-2v',
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'anzu': 'anzu#search_status',
        \   'currenttag': 'MyCurrentTag',
        \   'cakephp': 'MyCakephp',
        \ }
        \ }

  function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
  endfunction

  function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? vimshell#get_status_string() :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != MyModified() ? ' ' . MyModified() : '')
  endfunction

  function! MyFugitive()
    try
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
        return '⭠ ' . fugitive#head()
      endif
    catch
    endtry
    return ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction

  function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction

  function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
  endfunction

  function! MyCurrentTag()
    return tagbar#currenttag('%s', '')
  endfunction

  function! MyCakephp()
    return exists('*cake#buffer') ? cake#buffer('type') : ''
  endfunction

endif " }}}
if dein#is_sourced('tern_for_vim') " {{{
  " let g:tern_show_argument_hints = 'on_hold'
endif " }}}
if dein#is_sourced('vim-gitgutter') " {{{
  let g:gitgutter_enabled = 1
  let g:gitgutter_realtime = 0
  nmap gj <Plug>GitGutterNextHunk
  nmap gk <Plug>GitGutterPrevHunk
  nnoremap <Leader>gg :<C-u>GitGutterToggle<CR>
  nnoremap <Leader>gh :<C-u>GitGutterLineHighlightsToggle<CR>
endif " }}}
if dein#is_sourced('tagbar') " {{{
  let g:tagbar_ctags_bin = $HOME . '/bin/ctags'

  let g:tagbar_type_markdown = {
      \ 'ctagstype': 'markdown',
      \ 'ctagsbin' : $HOME . '/.vim/bundle/repos/github.com/markdown2ctags/markdown2ctags.py',
      \ 'ctagsargs' : '-f - --sort=yes',
      \ 'kinds' : [
          \ 's:sections',
          \ 'i:images'
      \ ],
      \ 'sro' : '|',
      \ 'kind2scope' : {
          \ 's' : 'section',
      \ },
      \ 'sort': 0,
  \ }
endif " }}}
if dein#is_sourced('tagbar-phpctags.vim') " {{{
  let g:tagbar_phpctags_bin = $HOME . '/bin/phpctags'
  let g:tagbar_phpctags_memory_limit = '512M'
endif " }}}
if dein#is_sourced('vim-json') " {{{
  let g:vim_json_syntax_conceal = 0
endif " }}}
if dein#is_sourced('syntastic') " {{{
  let g:syntastic_mode_map = {
        \ 'map' : 'active',
        \ 'active_filetypes' : ['php', 'javascript'],
        \ 'passive_filetypes' : [],
        \ }

  nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
  cabbrev <silent> bd lclose\|bdelete
endif " }}}
if dein#is_sourced('vim-quickrun') " {{{
  let g:quickrun_config = {
        \   "coffee" : {
        \     'command': 'coffee',
        \     'exec': ['%c -cbp %s']
        \   },
        \ }
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
endif " }}}
if dein#is_sourced('vim-choosewin') " {{{
  nmap  <C-w><CR>  <Plug>(choosewin)

  " オーバーレイを使う
  let g:choosewin_overlay_enable = 1

  " マルチバイトバッファでオーバーレイフォントを崩さないように
  let g:choosewin_overlay_clear_multibyte = 1

  let g:choosewin_blink_on_land      = 0 " 頼むから着地時にカーソル点滅をさせないでくれ！
  let g:choosewin_statusline_replace = 0 " どうかステータスラインリプレイスしないで下さい!
  let g:choosewin_tabline_replace    = 0 " どうかタブラインもリプレイスしないでいただきたい！
endif " }}}
if dein#is_sourced('neocomplete-php.vim') " {{{
  let g:neocomplete_php_locale = 'ja'
endif " }}}
" if dein#is_sourced('github-issues.vim') " {{{
  " let g:github_upstream_issues = 1
  " let g:gissues_default_remote = 'github'
" endif " }}}
if dein#is_sourced('github-complete.vim') " {{{
  let g:github_complete_enable_neocomplete = 1
  let g:github_complete_enable_emoji_completion = 1
  let g:github_complete_enable_issue_completion = 1
  let g:github_complete_enable_user_completion = 1
  let g:github_complete_enable_repo_completion = 1
  let g:github_complete_emoji_japanese_workaround = 1

endif " }}}
if dein#is_sourced('w.vim') " {{{
  let g:w_note_dir     = $HOME . '/Dropbox/w.vim/notes/'
  let g:w_database_dir = $HOME . '/Dropbox/w.vim/'
endif " }}}
if dein#is_sourced('gist-vim') " {{{
  let g:gist_privates = 1
  let g:gist_detect_filetype = 1
  let g:gist_show_privates = 1
  let g:gist_put_url_to_clipboard_after_post = 1
endif " }}}
if dein#is_sourced('vim-gista') " {{{
  let g:gista#github_user = 'violetyk'
  let g:gista#close_list_after_open = 1
endif " }}}
if dein#is_sourced('jedi.vim') " {{{
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
endif " }}}

let g:rspec_command = "Dispatch spring rspec {spec}"
let g:rspec_runner = "os_x_iterm"
nnoremap <silent><leader>s :<C-u>call Run
nnoremap <silent><leader>t :<C-u>call RunNearestSpec()<CR>
" }}}
