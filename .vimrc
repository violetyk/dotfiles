" vim:set ts=4 sts=2 sw=2 tw=0 ft=vim fdm=marker:

" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible

" Plugins {{{
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
" help {{{
NeoBundle 'vim-jp/vimdoc-ja'
" }}}
" utility {{{
" NeoBundle 'taglist.vim' " tab切り替え時にエラーが出るので下記fix版を使う。
NeoBundle 'rgo/taglist.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'sygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \ },
      \}
NeoBundle 'matchit.zip'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundleLazy 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundleLazy 'mattn/qiita-vim'
NeoBundle 'violetyk/scratch-utility'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'dbext.vim'
NeoBundleLazy 'motemen/hatena-vim'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundleLazy 'kana/vim-smartchr'
NeoBundleLazy 'kana/vim-smartinput'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'akiyan/vim-textobj-php'
NeoBundle 'vim-scripts/Align'
NeoBundle 'Lokaltog/vim-powerline'
" NeoBundle 'Lokaltog/powerline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'SQLUtilities'
NeoBundle 'tomtom/checksyntax_vim'
NeoBundle 'tomtom/quickfixsigns_vim'
" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'glidenote/nogistub.vim'
NeoBundle 'vim-scripts/Modeliner'
NeoBundle 'joonty/vdebug'
NeoBundle 'rking/ag.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
" }}}
" framework {{{
NeoBundle 'tpope/vim-rails'
" NeoBundle 'violetyk/cake.vim'
" NeoBundle 'git@github.com:nanapi/nanapi.vim.git'
NeoBundle 'naberon/vim-cakehtml'
" }}}
" unite source {{{
NeoBundle 'unite-colorscheme'
NeoBundle 'unite-locate'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'zhaocai/unite-scriptnames'
" }}}
" colorscheme {{{
NeoBundle 'mrkn256.vim'
NeoBundleLazy 'chriskempson/tomorrow-theme', {
      \ 'rtp': "~/.vim/bundle/tomorrow-theme/vim/",
      \ }
NeoBundleLazy 'nanotech/jellybeans.vim'
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
NeoBundle 'JavaScript-syntax'
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

  silent! colorscheme mrkn256
  " silent! colorscheme Tomorrow-Night-Bright
  " silent! colorscheme jellybeans

  " set background=dark
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


" php,ctpをバッファに追加したときにlcdする。
" autocmd BufAdd *.{php,ctp} execute "lcd " . expand("<afile>:p:h")

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


" バッファ・タブ操作 {{{
nnoremap <silent>bb :b#<CR>
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
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

" 縦分割版gf
nnoremap gs :vertical wincmd f<CR>
" }}}

" 移動量の調節 {{{
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
" }}}

" 検索操作 {{{

" ハイライトを消す。
noremap <Esc><Esc> :<C-u>set nohlsearch<Return>

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

" neocomplcache.vim {{{

" パラメータ設定 {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" 入力に大文字が入力されていたら、大文字小文字の区別をする
let g:neocomplcache_enable_smart_case = 0
" 大文字小文字区切りの曖昧検索をするかどうか。DT = D*T* -> DateTime
let g:neocomplcache_enable_camel_case_completion = 0
" アンスコ区切りであいまい検索を行うかどうか。m*_s -> mb_substr
let g:neocomplcache_enable_underbar_completion = 0
" バッファや辞書ファイル中で、補完対象となるキーワードの最小文字数
let g:neocomplcache_min_keyword_length = 3
" シンタックスファイル内で補完対象となるキーワードの最小文字数。
let g:neocomplcache_min_syntax_length = 3
" neocomplcacheを自動的にロックするバッファ名のパターンを指定。
" ku.vimやfuzzyfinderなど、neocomplcacheと相性が悪いプラグインを使用する場合に設定。
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 自動補完を開始する文字数。
let g:neocomplcache_auto_completion_start_lengh = 2
" ポップアップメニューで表示される候補数。デフォルトは100。
let g:neocomplcache_max_list = 30
" 補完候補の一番先頭を選択しとく
let g:neocomplcache_enable_auto_select = 1
" }}}
" ディレクトリ設定 {{{
if has('win32') || has('win64')
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions',
        \ 'php' : $VIM.'/vimfiles/dict/php.dict',
        \ }
elseif has('unix')
  " ディクショナリ
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'php' : $HOME.'/.vim/dict/php.dict',
        \ }

  " ユーザー定義スニペット保存ディレクトリ
  let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

  " キャッシュディレクトリ
  let g:neocomplcache_temporary_dir = '/dev/shm/' . $USER . '/.neocon'

endif
" }}}
" プラグインや補完関数の無効化 {{{
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_plugin_disable = {}
endif
" let g:neocomplcache_plugin_disable.tags_complete = 1;
" let g:neocomplcache_plugin_disable.syntax_complete = 1;
" let g:neocomplcache_plugin_disable.omni_complete = 1;
" }}}
" キーワード補完の設定 {{{
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
" 日本語を補完候補として取得しない
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" }}}
" タグ補完のパターンの設定 {{{
if !exists('g:neocomplcache_member_prefix_patterns')
    let g:neocomplcache_member_prefix_patterns = {}
endif
" let g:neocomplcache_member_prefix_patterns.php = '->\|::'
" let g:neocomplcache_member_prefix_patterns.htmlcake = '->\|::'
" }}}
" 補完の区切り文字パターンの設定 {{{
if !exists('g:neocomplcache_delimiter_patterns')
  let g:neocomplcache_delimiter_patterns = {}
endif
let g:neocomplcache_delimiter_patterns.php = ['-\>', '::', '\']
" }}}
" オムニ補完の設定 {{{
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,htmlcake setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php,htmlcake setlocal omnifunc=phpcomplete#CompletePHP

" オムニ補完のパターン
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
" 言語別neocompl自動発火パターン
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" }}}
" キーバインド {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" undo
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 共通の部分まで補完
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <expr><CR>  neocomplcache#smart_close_popup() ."\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" 補完を確定してポップアップを閉じる。
inoremap <expr><C-y>  neocomplcache#close_popup()
" 補完をキャンセルしてポップアップを閉じる
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" :NeoComplCacheEditSnippets [filetype]
" ユーザ定義用のスニペットファイルの編集ができる。
" ftを指定しなければ現在のftのスニペットファイルを開く。
" ちなみに、プラグインに組み込まれてるスニペットファイルは下記にある。
" ~/.vim/autoload/neocomplcache/sources/snippets_complete/
nnoremap <silent> <Space>es  :<C-u>NeoComplCacheEditSnippets 
" }}}

" }}}

" unite.vim {{{

nnoremap [unite] :<C-u>Unite<Space>
nmap f [unite]

" nnoremap <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" inoremap <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>

nnoremap [unite]b   :<C-u>Unite bookmark<CR>
nnoremap [unite]c   :<C-u>Unite cake_controller cake_model cake_config cake_component cake_behavior cake_helper cake_shell -start-insert<CR>
nnoremap [unite]d   :<C-u>UniteWithBufferDir -buffer-name=files file -start-insert<CR>
nnoremap [unite]f   :<C-u>UniteWithInputDirectory file_rec/async -start-insert<CR>
nnoremap [unite]g   :<C-u>Unite -no-quit grep<CR>
" nnoremap [unite]h   :<C-u>Unite history/command<CR>
nnoremap [unite]j   :<C-u>Unite buffer file_mru bookmark -start-insert<CR>
" nnoremap [unite]l   :<C-u>Unite locate -start-insert<CR>
nnoremap [unite]l   :<C-u>Unite line -start-insert<CR>
nnoremap [unite]L   :<C-u>UniteWithCursorWord line -start-insert -auto-preview<CR>
nnoremap [unite]m   :<C-u>Unite -start-insert -vertical -no-quit file:<C-r>=g:memolist_path."/"<CR><CR>
" nnoremap [unite]n   :<C-u>Unite neobundle/update<CR>
nnoremap [unite]o   :<C-u>Unite outline -buffer-name=outline -vertical -winwidth=45 -no-quit<CR>
" nnoremap [unite]o   :<C-u>Unite -buffer-name=outline -auto-preview -vertical -no-quit outline<CR>
nnoremap [unite]p   :<C-u>Unite process -start-insert<CR>
nnoremap [unite]r   :<C-u>Unite ref/phpmanual -start-insert<CR>
nnoremap [unite].   :<C-u>UniteResume<CR>
" nnoremap [unite]s   :<C-u>Unite history/search<CR>
nnoremap [unite]v   :<C-u>Unite output:version -start-insert<CR>
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
let g:ref_detect_filetype = {
      \ 'htmlcake' : 'phpmanual'
      \ }

" }}}

" scratch.vim {{{

nmap <silent> <Leader>b <Plug>ShowScratchBuffer
imap <silent> <Leader>b <Plug>InsShowScratchBuffer

" スクラッチバッファを開くマッピングを定義しない
let no_plugin_maps = 1

" vim終了時にスクラッチの内容を保存しておく。
let g:scratchBackupFile=$HOME . "/scratch.txt"

" }}}

" zencoding.vim {{{

" デフォルトは<C-Y>
let g:user_zen_leader_key = '<C-Space>'

" タグやスニペットの入力補完を使う
let g:use_zen_complete_tag = 1

" user_zen_leader_key -> カンマで展開ではなく、一発で展開する。
" let g:user_zen_expandabbr_key = '<C-Z>'

" filterについて -> http://code.google.com/p/zen-coding/wiki/Filters
let g:user_zen_settings = {
      \ 'lang' : 'ja',
      \ 'indentation' : '\t',
      \ 'html' : {
      \   'indentation' : '  ',
      \   'filters' : 'html,c',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'filters' : 'html',
      \ },
      \ 'htmlcake' : {
      \   'indentation' : '  ',
      \   'extends' : 'html',
      \ },
      \ 'perl' : {
      \   'aliases' : { 
      \     'req' : 'require '
      \   },
      \   'snippets' : {
      \     'use' : "use strict\nuse warnings\n\n",
      \     'warn' : "warn \"|\";",
      \   }
      \ }
      \}

" }}}

" cake.vim {{{

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

" powerline.vim {{{ 

if has('gui_running') 
  let g:Powerline_symbols = 'fancy'
endif
" CUI環境下でいろ変更が遅れることがある対応
if has('unix') && !has('gui_running')
  inoremap <silent> <Esc> <Esc>
  inoremap <silent> <C-[> <Esc>
endif

" }}}

" memolist.vim {{{

let g:memolist_memo_suffix = "markdown"
" let g:memolist_memo_suffix = "txt"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
" let g:memolist_memo_date = "epoch"
" let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
" let g:memolist_prompt_categories = 1
" let g:memolist_qfixgrep = 1
" let g:memolist_vimfiler = 1
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

" nnoremap <Leader>mf :exe "CtrlP" g:memolist_path<CR><F5>
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


" }}}

let g:loaded_vimrc = 1
