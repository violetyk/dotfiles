" vim:set ts=4 sts=2 sw=2 tw=0 ft=vim fdm=marker:

" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible

" Plugins {{{
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" パスを通さないけどNeoBundleで管理する
NeoBundleFetch 'Shougo/neobundle.vim'

" help {{{
NeoBundle 'vim-jp/vimdoc-ja'
" }}}
" base {{{
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'sygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \ },
      \}
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-textobj-user'
" }}}
" utility {{{
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'violetyk/scratch-utility'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'motemen/hatena-vim'
NeoBundleLazy 'kana/vim-smartchr'
NeoBundleLazy 'kana/vim-smartinput'
NeoBundle 'akiyan/vim-textobj-php'
NeoBundle 'akiyan/vim-textobj-xml-attribute'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tomtom/checksyntax_vim'
NeoBundle 'tomtom/quickfixsigns_vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'glidenote/nogistub.vim'
NeoBundle 'vim-scripts/Modeliner'
NeoBundle 'joonty/vdebug'
NeoBundle 'rking/ag.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'
NeoBundle 'osyo-manga/vim-anzu'
" NeoBundle 'gcmt/breeze.vim'
" NeoBundle 'marijnh/tern_for_vim'

NeoBundle 'shawncplus/phpcomplete.vim'

" }}}
" game {{{
NeoBundle 'mattn/habatobi-vim'
" }}}
" framework {{{
NeoBundleLazy 'tpope/vim-rails'
" NeoBundle 'violetyk/cake.vim'
" NeoBundle 'git@github.com:nanapi/nanapi.vim.git'
" }}}
" unite source {{{
NeoBundle 'unite-colorscheme',         { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'unite-locate',              { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'h1mesuke/unite-outline',    { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'tacroe/unite-mark',         { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'zhaocai/unite-scriptnames', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'thinca/vim-editvar',        { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'ujihisa/unite-launch',      { 'depends' : 'Shougo/unite.vim' }
" }}}
" statusline, colorscheme {{{
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'mrkn256.vim'
NeoBundleLazy 'chriskempson/tomorrow-theme', {
      \ 'rtp': "~/.vim/bundle/tomorrow-theme/vim/",
      \ }
NeoBundleLazy 'nanotech/jellybeans.vim'
NeoBundleLazy 'w0ng/vim-hybrid'
NeoBundleLazy 'desert.vim'
NeoBundleLazy 'desert256.vim'
NeoBundleLazy 'tomasr/molokai'
NeoBundleLazy 'Zenburn'
NeoBundleLazy 'altercation/vim-colors-solarized'
" }}}
" syntax {{{
" NeoBundle 'php.vim--Garvin'
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'jQuery'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-markdown'
" }}}
" indent {{{
NeoBundle 'pangloss/vim-javascript'
" }}}

filetype plugin indent on
" }}}

" 基本的な設定: {{{

" ファイル形式別のプラグインとインデントを有効にする
filetype indent plugin on

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

" 補完時、現在選択中の候補の付加情報を表示しない。
set completeopt-=preview

" 正規表現エンジンの設定
set regexpengine=1
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

" □とか○の文字があってもカーソル位置がずれないようにす
" powerline を使った時にステータスラインが更新されない場合があるのsingleで。
" set ambiwidth=double
set ambiwidth=single

" }}}

" バックアップ・スワップの設定 {{{

" バックアップをとらない
set nobackup

" バックアップをとる
" set backup

" ファイルの上書きの前にバックアップを作る
" (backup がオフの場合、バックアップは上書きに成功した後削除される)
" set writebackup


" バックアップを作成しないファイルパターン
" set backupskip = escape(expand('$HOME'), '\') . '/tmp/*'

" バックアップ名の最後に文字列を追加
au BufWritePre * let &bex = '-' . strftime("%Y%m%d_%H%M")

" バックアップファイルを作るディレクトリ
if has('win32') || has('win64')
  set backupdir=$VIM/backup
else
  set backupdir=$HOME/backup
endif

" スワップファイルを作らない
" set noswapfile

" スワップファイルを作るディレクトリ
if has('win32') || has('win64')
  set directory=$VIM/swap
else
  set directory=$HOME/swap
endif
" スワップファイルの更新間隔文字数
set updatecount=500

" }}}

" 環境別の設定・カラースキーマ {{{
if has('gui_running')
  " GUI共通 {{{

  " カラースキーマ
  set background=light
  silent! colorscheme solarized

  " マウスを使う。
  "set mouse=a
  "set ttymouse=xterm2

  " 入力時にマウスポインタを隠す (nomousehide:隠さない)
  set mousehide

  " GUIの設定。m:メニュー、r:右垂直バー、b:下のスクロールバー、l:左垂直バー
  " set guioptions=m
  set guioptions=

  " }}}
  " Windows gvim {{{
  if has('win32') || has('win64')
    " Font
    " Windows の gvim でフォントを設定するには guifont オプションと guifontwide オプションを使う。
    " 前者がいわゆる半角文字のフォント、後者が全角文字のフォント。
    " どちらもカンマで区切って複数のフォントを指定できる (最初に利用可能なフォントが選ばれる)。例えば _gvimrc に以下のように書く:
    " set guifont=Consolas:h10,Lucida_Console:h10:w5 guifontwide=MS_Gothic:h10
    " h10"はフォントの高さを 10 ポイントにする指定。同様に"w5"は幅を 5 ポイントにする。
    " 半角と全角でフォントを使い分ける必要がない場合は guifont だけ設定すればよい。

    " set guifont=MS_Gothic:h9:cSHIFTJIS
    " set guifont=MS_Mincho:h12:cSHIFTJIS
    " set guifont=Osaka－等幅:h9:cSHIFTJIS
    set guifont=TakaoGothic:h10:cSHIFTJIS

    " ヤンク内容をwindowsのクリップボードに格納する。
    set clipboard=unnamed

    " 起動したときに最大化
    au GUIEnter * simalt ~x

  " }}}
  " MacOSX gvim {{{
  elseif has('mac')

    set guifont=Ricty\ 11

  " }}}
  " Linux gvim {{{
  elseif has('gui_gtk2')

    " Font
    set guifont=Terminus-ja\ 11
    " set guifont=Migu\ 1M\ 11

  endif
  " }}}
else
  " CUI vim {{{

  " 補完の色を変更
  " hi Pmenu ctermfg=Black ctermbg=Grey
  " hi PmenuSel ctermbg=Blue
  " hi PmenuSbar ctermbg=Cyan

  " 対応する括弧の色を控えめにしておく
  " hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black

  " silent! colorscheme molokai
  silent! colorscheme mrkn256
  " silent! colorscheme Tomorrow-Night-Bright
  " silent! colorscheme jellybeans

  " set background=light
  " silent! colorscheme solarized
  " let g:solarized_termtrans = 1

  " }}}
endif
" }}}

" 表示色の設定 {{{

" 色のチェック方法
" :so $VIMRUNTIME/syntax/colortest.vim

" 全角スペースの表示
"highlight ZenkakuSpace cterm=underline ctermfg=red guibg=red

" エラーと同じハイライトを適用。
highlight link ZenkakuSpace Error
autocmd BufRead,BufNew * match ZenkakuSpace /　/

" ステータスラインの色 ctermfgがバックの色で、ctermbgがフロントの文字色
" highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
" highlight StatusLine term=reverse cterm=reverse ctermfg=blue ctermbg=white

" 入力モードの時にステータスラインの色を変える。
let g:hi_insert = 'highlight StatusLine guifg=LightGrey guibg=darkblue gui=none ctermfg=white ctermbg=blue cterm=none'

if has('syntax')
augroup InsertHook
  autocmd!
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" カーソルラインのハイライト。reverseで反転表示。
" highlight CursorLine term=reverse cterm=reverse

" カーソル列のハイライト。reverseで反転表示。
" highlight CursorColumn term=reverse cterm=reverse

" }}}

" 検索・補完の設定 {{{

" コマンド、検索パターンを100個まで履歴に残す
set history=100

" 検索の時に大文字小文字を区別しない
set ignorecase

" 検索altercation / solarized の時に大文字が含まれている場合は区別して検索する
set smartcase

" 最後altercation / solarized まで検索したら先頭に戻る
set wrapscan

" インクリメンタルサーチを使わない
"set noincsearch
set incsearch

" コマンドライン補完を拡張モードにする
set wildmenu

" 複数のマッチがあるときは、全てのマッチを羅列する。
set wildmode=full

" コマンドラインの補完キー
set wildchar=<Tab>

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

" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
"set wrap
set nowrap

" カーソルラインを表示させる
" set cursorline
" カーソル列を表示させる
" set cursorcolumn

" コマンド実行中は再描画しない
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

" オートコマンド {{{ 

" カーソル位置を記憶する
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
   \ endif

" javascript って打つのがめんどくさいので js にする
autocmd FileType js setlocal ft=javascript

" :vimgrep や :makeしたときに自動的にQuickFixを開く
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen


" 場所ごとに設定を用意する。
" 下の例では場所ごとのファイルは.vimrc_local
"
"   設定ファイルには例えば下記のようなことを書いておく。
"   カレントディレクトリを設定ファイルがある階層に移動
"   lcd <sfile>:h
function! s:vimrc_local(loc)
    let files = findfile('.vimrc_local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction
augroup vimrc-local
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

" vimrcの一番最後でloaded_vimrcを1にしてる。
if exists('g:loaded_vimrc') && g:loaded_vimrc == 0
    call s:vimrc_local(getcwd())
endif

" vimで新しいファイルを作るとき、ディレクトリがなければ確認して作る。
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

" ウィンドウを移動する度に外部で変更のあったファイルを自動的に読み直す
" 関連：autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END


" }}}

" コマンド {{{

" 戦闘力を計測
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
      \        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)

" cdpathからcdする
command! -complete=customlist,CompleteCD -nargs=? CD cd <args>
function! CompleteCD(arglead, cmdline, cursorpos)
  let pattern = join(split(a:cmdline, '\s', !0)[1:], '') . '*/'
  return split(globpath(&cdpath, pattern), "\n")
endfunction
" コマンドラインの時だけcdをCDとして略語展開
cnoreabbrev <expr> cd
      \ (getcmdtype() == ':' && getcmdline() ==# 'cd') ? 'CD' : 'cd'


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

" 移動量の調節
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
" }}}

" 検索操作 {{{

" ハイライトを消す。
noremap <silent> <Esc><Esc> :<C-u>set nohlsearch<Return>:<C-u>AnzuClearSearchStatus<Return>

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
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" レジスタやマークを確認しやすくする。
nnoremap <Space>m :<C-u>marks<Space>
nnoremap <Space>r :<C-u>registers<Space>


function! IsEndOfLine(char)
  let c = getline(".")[col("$")-2]
  if c != a:char
    return 1
  else
    return 0
  endif
endfunction
" 行末に;を追加する。
" inoremap <expr>;; IsEndOfLine() ? "<C-O>$;<CR>" : "<C-O>$<CR>"
inoremap <expr>;; IsEndOfLine(";") ? "<C-O>$;" : "<C-O>$"
nnoremap <expr>;; IsEndOfLine(";") ? "$a;<Esc>" : "$"
" 行末に,を追加する。
inoremap <expr>,, IsEndOfLine(",") ? "<C-O>$," : "<C-O>$"
nnoremap <expr>,, IsEndOfLine(",") ? "$a,<Esc>" : "$"

" vimスクリプト開発用に即バッファをsource。
" nnoremap <Leader>so :<C-u>source %<CR>

" ev / eg ですぐに.vimrcを開けるようにする。rv / rg で反映させる。
if has('gui_running')
  nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
  nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>
else
  nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
  nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>
endif

" カレントバッファのファイル名をヤンク
nnoremap <silent> <Leader>yf :<C-u>let @" = expand("%:t")<CR>:echo "yank: ". @"<CR>
" カレントバッファのフルパスをヤンク
nnoremap <silent> <Leader>yp :<C-u>let @" = expand("%:p")<CR>:echo "yank: ". @"<CR>

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

" <C-Space>を押すと<Nul>が送られるようなので。
map! <Nul> <C-Space>

" ヘルプを引きやすくする
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

" }}}

"}}}

" プラグインの設定 {{{

" NERD commenter {{{

"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1
" /**/をスペース空けて/* */
let NERDSpaceDelims = 1

" }}}

" NERDTree {{{

" カラー表示するか
let NERDChristmasTree = 1
" 起動時に隠しファイルを表示するか（あとで切り替えられる）
let NERDTreeShowHidden = 0
" カーソル行を強調する場合1
let NERDTreeHighlightCursorline = 0
" NERDTreeウィンドウのサイズ
let NERDTreeWinSize = 30
" NERDTreeウィンドウを横に表示するか上に表示するか
let NERDTreeWinPos = "left"

nnoremap <silent> <Leader>e :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :<C-u>NERDTreeFind<CR>
autocmd BufEnter * if bufname('%') =~ 'NERD_tree_\d\+'|setlocal cursorline|endif

let NERDTreeHijackNetrw = 0
let NERDTreeAutoCenter = 0

" }}}

" taglist.vim / ctags {{{
set showfulltag

if has('win32') || has('win64')
  let Tlist_Ctags_Cmd = "ctags"
else
  let Tlist_Ctags_Cmd = "ctags"
endif

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


nnoremap <silent> <Leader>t :TlistOpen<CR>

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

" }}}

" neocomplete.vim {{{

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

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
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

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

" }}}

" neosnippet.vim {{{
let g:neosnippet#snippets_directory = $HOME.'/.vim/snippets'

nnoremap <silent> <Space>es  :<C-u>NeoSnippetEdit -split -vertical 
nnoremap <silent> <Space>rs  :<C-u>NeoSnippetSource 

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
xmap <C-l> <Plug>(neosnippet_start_unite_snippet_target)

" For snippet_complete marker.
" if has('conceal')
  " set conceallevel=2 concealcursor=i
" endif

" }}}

" unite.vim {{{

" To track long mru history.
let g:unite_source_file_mru_long_limit = 3000
let g:unite_source_directory_mru_long_limit = 3000
let g:unite_prompt = '» '

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{
  " Overwrite settings.

  nmap <buffer> <ESC>    <Plug>(unite_exit)
  imap <buffer> jj       <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

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
  nnoremap <silent><buffer><expr> l unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
endfunction "}}}


nnoremap [unite] :<C-u>Unite<Space>
nmap f [unite]

" nnoremap <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" inoremap <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap [unite]b   :<C-u>Unite bookmark<CR>
nnoremap [unite]c   :<C-u>Unite cake_controller cake_model cake_config cake_component cake_behavior cake_helper cake_shell cake_fixture cake_core cake_lib n_class -start-insert<CR>
nnoremap [unite]d   :<C-u>UniteWithBufferDir -buffer-name=files file -start-insert<CR>
nnoremap [unite]e   :<C-u>Unite output:echo\ system('set')<CR>
nnoremap [unite]f   :<C-u>UniteWithInputDirectory file_rec/async -start-insert<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup'
  let g:unite_source_grep_recursive_opt = ''
" let g:unite_source_grep_max_candidates = 200
  nnoremap [unite]g   :<C-u>Unite -no-quit grep<CR>
  nnoremap [unite]G   :<C-u>Unite -no-quit grep<CR><CR><C-r><C-w><CR>
else
  nnoremap [unite]g   :<C-u>Unite -no-quit grep<CR>
endif

" nnoremap [unite]h   :<C-u>Unite history/command<CR>
nnoremap [unite]j   :<C-u>Unite buffer file_mru bookmark -start-insert<CR>
" nnoremap [unite]l   :<C-u>Unite locate -start-insert<CR>
nnoremap [unite]l   :<C-u>Unite line -start-insert<CR>
nnoremap [unite]L   :<C-u>UniteWithCursorWord line -start-insert -auto-preview<CR>
nnoremap [unite]m   :<C-u>Unite -start-insert file:<C-r>=g:memolist_path."/"<CR><CR>
" nnoremap [unite]n   :<C-u>Unite neobundle/update<CR>
nnoremap [unite]o   :<C-u>Unite outline -buffer-name=outline -vertical -winwidth=45 -no-quit<CR>
" nnoremap [unite]o   :<C-u>Unite -buffer-name=outline -auto-preview -vertical -no-quit outline<CR>
nnoremap [unite]p   :<C-u>Unite process -start-insert<CR>
nnoremap [unite]r   :<C-u>Unite ref/phpmanual -start-insert<CR>
nnoremap [unite].   :<C-u>UniteResume<CR>
" nnoremap [unite]s   :<C-u>Unite history/search<CR>
" nnoremap [unite]v   :<C-u>Unite output:version -start-insert<CR>
nnoremap [unite]v   :<C-u>Unite variable -auto-preview -start-insert<CR>

let g:unite_source_history_yank_enable = 1
nnoremap [unite]y   :<C-u>Unite history/yank<CR>
nnoremap [unite]A   :<C-u>Unite output:autocmd<CR>
nnoremap [unite]C   :<C-u>Unite change<CR>
nnoremap [unite]J   :<C-u>Unite jump<CR>
" nnoremap [unite]L   :<C-u>Unite launcher<CR>
nnoremap [unite]M   :<C-u>Unite output:messages<CR>
" nnoremap [unite]M   :<C-u>Unite mapping -start-insert<CR>
nnoremap [unite]R   :<C-u>Unite -buffer-name=register register<CR>
nnoremap [unite]S   :<C-u>Unite output:scriptnames<CR>
" }}}

" ref.vim {{{
if has('win32') || has('win64')
  let g:ref_phpmanual_path = $VIM . '/vimfiles/manual/php_manual_ja/'
else
  let g:ref_phpmanual_path = $HOME . '/.vim/manual/php_manual_ja/'
endif


" ftと辞書のマッピング
" let g:ref_detect_filetype = {
      " \ 'htmlcake' : 'phpmanual'
      " \ }

" }}}

" scratch.vim {{{

nmap <silent> <Leader>b <Plug>ShowScratchBuffer
imap <silent> <Leader>b <Plug>InsShowScratchBuffer

" スクラッチバッファを開くマッピングを定義しない
let no_plugin_maps = 1

" vim終了時にスクラッチの内容を保存しておく。
let g:scratchBackupFile=$HOME . "/scratch.txt"

" }}}

" emmet.vim {{{

" デフォルトは<C-Y>
" let g:user_emmet_leader_key = '<C-Space>'

" タグやスニペットの入力補完を使う
let g:use_emmet_complete_tag = 1

" <Tab>で展開
" autocmd FileType css imap <tab> <plug>(EmmetExpandAbbr)

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
" }}}

" cake.vim {{{

let g:cakephp_gf_fallback_n = "normal \<Plug>(gf-user-gf)"
let g:cakephp_gf_fallback_s = "normal \<Plug>(gf-user-\<C-w>f)"
let g:cakephp_gf_fallback_t = "normal \<Plug>(gf-user-\<C-w>gf)"

nnoremap <Space>cc :<C-u>Ccontroller 
" nnoremap <Space>ccv :<C-u>Ccontrollervsp 
nnoremap <Space>cm :<C-u>Cmodel 
nnoremap <Space>cv :<C-u>Cview 
nnoremap <Space>cl :<C-u>Clog 
nnoremap <Space>ccv :<C-u>Ccontrollerview
nnoremap <Space>ccm :<C-u>Ccomponent 
nnoremap <Space>ccf :<C-u>Cconfig 
nnoremap <Space>cb :<C-u>Cbehavior 
nnoremap <Space>ch :<C-u>Chelper 
nnoremap <Space>ct :<C-u>Ctest 
nnoremap <Space>cf :<C-u>Cfixture 
nnoremap <Space>cs :<C-u>Cshell 
nnoremap <Space>cd :<C-u>Cdesc 

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

" }}}

" gist.vim {{{

let g:gist_privates = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_put_url_to_clipboard_after_post = 1

" }}}

" hatena.vim {{{
let g:hatena_user = 'yuhei_kagaya'
" }}}

" PDV--phpDocumentor-for-Vim {{{

inoremap <Leader>d <ESC>:call PhpDocSingle()<CR>i
nnoremap <Leader>d :call PhpDocSingle()<CR>
vnoremap <Leader>d :call PhpDocRange()<CR>

" }}}

" surround.vim {{{
let g:surround_{char2nr("p")} = "<?php \r ?>"
" }}}

" memolist.vim {{{

let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_prompt_tags = 1
" let g:memolist_prompt_categories = 1
let g:memolist_filename_prefix_none = 1
let g:memolist_template_dir_path = '~/dotfiles/memotemplates'

" Function: s:MemoRemove() メモをゴミ箱に入れる。 {{{
function! s:MemoRemove()
  let src        = g:memolist_path . '/' . expand("%:t")
  let trash_path = g:memolist_path . '/../.trash'
  let dest       = trash_path . '/' . expand("%:t") . '.del.' . strftime("%Y%m%d_%H%M")

  let name = expand("%:t:r")

  if !filereadable(src)
    return 0
  endif

  let choice = confirm('Remove ' . name . " ?", "&Yes\n&No", 0)
  if choice == 0
    " Was interrupted. Using Esc or Ctrl-C.
    return 0
  elseif choice == 1
    let result1 = system("mkdir -p " . trash_path)
    let result2 = system("mv " . src . " " . dest)
    if strlen(result1) != 0 && strlen(result2) != 0
      echohl WarningMsg | redraw | echo 'Error!' | echohl None
      return 0
    else
      execute "normal bd"
      return 1
    endif
  endif

  return 0
endfunction "}}}

nnoremap <Leader>mc :MemoNew<CR>
nnoremap <Leader>mg :MemoGrep<CR>
nnoremap <Leader>ml :MemoList<CR>
nnoremap <silent> <Leader>md :call <SID>MemoRemove()<CR>
" }}}

" Modeliner {{{

let g:Modeliner_format='ft= et ff= fenc= sts= sw= ts='

" }}}

" Fugitive {{{
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
" }}}

" dbext.vim {{{

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

" }}}

" easymotion {{{
" ホームポジションに近いキーを使う
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key = "<Space>"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping = 1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
" }}}

" localrc.vim {{{
silent! call localrc#load('.init.vimrc', $HOME)
" }}}

" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size = 1
" }}}

" violetyk/scratch-utility {{{
let g:scratchSplitOption =
      \ {
      \   'vertical'           : 1,
      \   'take_over_filetype' : 1
      \ }
" }}}

" vim-anzu {{{
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" set statusline=%{anzu#search_status()}
" }}}

" yanktmp.vim {{{
map <silent> ty :call YanktmpYank()<CR>
map <silent> tp :call YanktmpPaste_p()<CR>
map <silent> tP :call YanktmpPaste_P()<CR>
let g:yanktmp_file = '/tmp/vimyanktmp'
" }}}

" precious " {{{
let g:precious_enable_switchers = {
      \ "*" : {
      \   "setfiletype" : 0
      \ },
      \ "markdown" : {
      \   "setfiletype" : 1
      \ },
      \}
" }}}

" breeze.vim {{{
let g:breeze_highlight_filename_patterns = '*.ctp,*.html,*.htm,*.xhtml,*.xml'
let g:breeze_highlight_tag = 1
let g:breeze_hl_color = 'ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black '
nnoremap th :<C-u>BreezeHlElementBlock<CR>

" }}}

" lightline {{{ 
let g:lightline = {
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
function! MyReadonly()
  return &readonly ? '' : ''
endfunction
function! MyFugitive()
  return exists("*fugitive#head") && strlen(fugitive#head()) ? ''.fugitive#head() : ''
endfunction

" }}}

" let g:tern_show_argument_hints = 'on_hold'

" gitgutter {{{
nmap gj <Plug>GitGutterNextHunk
nmap gk <Plug>GitGutterPrevHunk
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
" }}}

" }}}

let g:unite_launch_apps = [
      \ 'git push',
      \ ]

let g:loaded_vimrc = 1

