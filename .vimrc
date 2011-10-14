" vim:set ts=4 sts=2 sw=2 tw=0 ft=vim:

" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible

"----------------------------------------------------
" Vundle関連
"----------------------------------------------------
filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()

" utility
Bundle 'taglist.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'unite-colorscheme'
Bundle 'unite-locate'
Bundle 'h1mesuke/unite-outline'
Bundle 'surround.vim'
Bundle 'matchit.zip'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Marks-Browser'
Bundle 'ShowMarks'
Bundle 'AutoClose'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-localrc'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'scratch-utility'
Bundle 'rails.vim'
Bundle 'naberon/vim-cakehtml'
Bundle 'violetyk/cake.vim'

" colorscheme
Bundle 'desert.vim'
Bundle 'mrkn256.vim'
Bundle 'molokai'
Bundle 'Zenburn'
Bundle 'Solarized'
Bundle 'ChocolatePapaya'


" syntax
Bundle 'jQuery'

" 日本語ヘルプフリーズ問題対策。
set notagbsearch

"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
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
" 文字コードの設定

" Vim内部で使われる文字エンコーディング
" set encoding=utf-8

" ターミナルで使われるエンコーディング
" set termencoding=utf-8

" カレントバッファのファイルの文字エンコーディング
" set fileencoding=utf-8

" 読めなかったときに試される順番。
"set fileencodings=ucs-bom,euc-jp,cp932,sjis,utf-8

" 文字コードの自動認識 http://www.kawaz.jp/pukiwiki/?vim
if &encoding !=# 'utf-8'
 set encoding=japan
 set fileencoding=japan
endif
if has('iconv')
 let s:enc_euc = 'euc-jp'
 let s:enc_jis = 'iso-2022-jp'
 " iconvがeucJP-msに対応しているかをチェック
 if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
   let s:enc_euc = 'eucjp-ms'
   let s:enc_jis = 'iso-2022-jp-3'
 " iconvがJISX0213に対応しているかをチェック
 elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==#
 "\xad\xc5\xad\xcb"
   let s:enc_euc = 'euc-jisx0213'
   let s:enc_jis = 'iso-2022-jp-3'
 endif
 " fileencodingsを構築
 if &encoding ==# 'utf-8'
   let s:fileencodings_default = &fileencodings
   let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
   let &fileencodings = &fileencodings .','. s:fileencodings_default
   unlet s:fileencodings_default
 else
   let &fileencodings = &fileencodings .','. s:enc_jis
   set fileencodings+=utf-8,ucs-2le,ucs-2
   if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
     set fileencodings+=cp932
     set fileencodings-=euc-jp
     set fileencodings-=euc-jisx0213
     set fileencodings-=eucjp-ms
     let &encoding = s:enc_euc
     let &fileencoding = s:enc_euc
   else
     let &fileencodings = &fileencodings .','. s:enc_euc
   endif
 endif
 " 定数を処分
 unlet s:enc_euc
 unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
 function! AU_ReCheck_FENC()
   if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
     let &fileencoding=&encoding
   endif
 endfunction
 autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする？
if exists('&ambiwidth')
  set ambiwidth=double
endif


"----------------------------------------------------
" バックアップ
"----------------------------------------------------
" バックアップをとらない
"set nobackup
" ファイルの上書きの前にバックアップを作る
" (backup がオフの場合、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
set backup
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
"set noswapfile
" スワップファイルを作るディレクトリ
if has('win32') || has('win64')
  set directory=$VIM/swap
else
  set directory=$HOME/swap
endif
" スワップファイルの更新間隔文字数
set updatecount=500


"----------------------------------------------------
" 環境別の設定・カラースキーマ
"----------------------------------------------------

if has('gui_running')
  "--------------------------------------------------
  " GUI
  "--------------------------------------------------

  " カラースキーマ .vim/colors/の中に入れる
  " syntax enable
  " " set background=light
  " set background=dark
  " colorscheme solarized
  colorscheme desert

  " マウスを使う。
  "set mouse=a
  "set ttymouse=xterm2

  " 入力時にマウスポインタを隠す (nomousehide:隠さない)
  set mousehide

  " GUIの設定。m:メニュー、r:右垂直バー、b:下のスクロールバー、l:左垂直バー
  " set guioptions=m
  set guioptions=


  if has('win32') || has('win64')
    "--------------------------------------------------
    " Windows用 gvim
    "--------------------------------------------------

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


  elseif has('mac')
    "--------------------------------------------------
    " Mac用 gvim
    "--------------------------------------------------

  elseif has('gui_gtk2')
    "--------------------------------------------------
    " Linux gvim
    "--------------------------------------------------

    " Font
    set guifont=Terminus-ja\ 11
    " set guifont=Migu\ 1M\ 11

  endif

else
  "--------------------------------------------------
  " CUI
  "--------------------------------------------------

  " 補完の色を変更
  hi Pmenu ctermfg=Black ctermbg=Grey
  hi PmenuSel ctermbg=Blue
  hi PmenuSbar ctermbg=Cyan

  " 対応する括弧の色を控えめにしておく
  hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black

endif



"----------------------------------------------------
" 表示色関係

" 色のチェック方法
" :so $VIMRUNTIME/syntax/colortest.vim
"----------------------------------------------------

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


"--------------------------------------------------
" 日本語入力固定モード（im_control.vim）
"--------------------------------------------------
if has('win32') || has('win64')

  " 「日本語入力固定モード」切替キー
  inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>

  " GVimの時だけ「日本語入力固定モード」の vi協調モードを無効化
  let IM_vi_CooperativeMode = has('gui_running') ? 0 : 1

elseif has('unix')

  " http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control#install
  " 「日本語入力固定モード」切替キー
  inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
  " 自動生成するファイルの保存場所
  let IM_CtrlIBusPythonFileDir = '~/.ibus'

  if has('gui_running')

    " うなくいかない。。。

    " GVimの時だけ「日本語入力固定モード」の vi協調モードを無効化
    " IM自体にvi協調モードがある場合は、0で「日本語入力固定モード」独自のvi協調モードをスキップさせる
    let IM_vi_CooperativeMode = 0

    " let IM_CtrlMode = 1
    " PythonによるIBus制御を使用する
    let IM_CtrlIBusPython = 1
    " let IM_JpFixModeAutoToggle = 1

    " iminsert=1を設定して IBusの vi協調モードを無効化する
    " set iminsert=1
    " 制御スクリプトを同期処理で呼び出し
    " let IM_CtrlAsync = ''
    " 制御スクリプトを非同期で呼び出し(default)
    " let IM_CtrlAsync = '&'
  else
    let IM_vi_CooperativeMode = 1
    let IM_CtrlMode = 3
    " PythonによるIBus制御を使用する
    let IM_CtrlIBusPython = 1
    " let IM_JpFixModeAutoToggle = 1
  endif
endif


"----------------------------------------------------
" 検索・補完
"----------------------------------------------------
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

" コマンドラインの補完キー
set wildchar=<Tab>

"----------------------------------------------------
" 画面表示
"----------------------------------------------------
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


"----------------------------------------------------
" ステータスライン
"----------------------------------------------------
" 入力中のコマンドをステータスに表示する
set showcmd

" ステータスラインを常に表示
set laststatus=2

" ステータスラインの行数
set cmdheight=2

" ステータスラインに表示する情報の指定
" set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l行/%L行(%p%%),%v列>
set statusline=%n\:%y%F\ %m%r%=[%{(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%l/%L(%p%%),%v]


"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
"set noautoindent

" タブが対応する空白の数
set tabstop=4

" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4

" インデントの各段階に使われる空白の数
set shiftwidth=4

" タブはハードタブとして入力する
set noexpandtab
" タブは空白として入力する（実際にTABを入力したい場合は<C-V><TAB>）
" set expandtab


"----------------------------------------------------
" オートコマンド関連
"----------------------------------------------------
" カーソル位置を記憶する
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
   \ endif

" javascript って打つのがめんどくさいので js にする
autocmd FileType js setlocal ft=javascript

" :vimgrep や :makeしたときに自動的にQuickFixを開く
au QuickfixCmdPost make,grep,grepadd,vimgrep copen


" 場所ごとに設定を用意する。
" 下の例では場所ごとのファイルは.vimrc_local
"
"   設定ファイルには例えば下記のようなことを書いておく。
"   カレントディレクトリを設定ファイルがある階層に移動
"   lcd <sfile>:h
"
augroup vimrc-local
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
    let files = findfile('.vimrc_local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction

" vimrcの一番最後でloaded_vimrcを1にしてる。
if exists('g:loaded_vimrc') && g:loaded_vimrc == 0
    call s:vimrc_local(getcwd())
endif


" php,ctpをバッファに追加したときにlcdする。
" autocmd BufAdd *.{php,ctp} execute "lcd " . expand("<afile>:p:h")

" vimで新しいファイルを作るとき、ディレクトリがなければ確認して作る。
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}


" ウィンドウを移動する度に外部で変更のあったファイルを自動的に読み直す
" 関連：autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END


"----------------------------------------------------
" keybindの設定
"
"   map = 挿入モードとコマンドラインモード以外のモード
"   map! = 挿入モードとコマンドラインモード
"   vmap = VISUAL モード
"   nmap = ノーマルモード
"   imap = 挿入モード
"   cmap = コマンドライン
"   noremap = ノーマルモード/ビジュアルモード/オペレーティングモード
"   nnoremap = ノーマルモードのみ。
"
"   「nnoremap {lhs} {rhs}」はnormalモードのkey mappingを定義するコマンド．
"   {lhs}のキーシーケンスを{rhs}にマッピングする．
"   {rhs}中のキーがさらにマッピングされていても再帰的な展開はしない．
"   nnoremapの{rhs}に<Nop>を指定すると，{lhs}を入力しても何も起こらなくなる(No Operation)．
"   nnoremapで「<silent>」を指定すると，マッピングされたキーが実行されたときに
"   コマンドラインへの出力を行わなくなる(ちらつき対策)．
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
"----------------------------------------------------

" <C-Space>を押すと<Nul>が送られるようなので。
map <Nul> <C-Space>
map! <Nul> <C-Space>

" ヘルプを引きやすくする
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

" 分割幅を広く
map <PageUp> 3<C-w>+
" 分割幅を狭く
map <PageDown> 3<C-w>-


" 移動量アップ
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" ev / eg ですぐに.vimrcを開けるようにする。rv / rg で反映させる。
if has('gui_running')
  nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
  nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>
else
  nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
  nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>
endif

" Ctrl+Nで次のバッファを表示(YankRingとバッティングする)
map <silent> <C-N> :bnext<CR>
" Ctrl+Pで前のバッファを表示(YankRingとバッティングする)
map <silent> <C-P> :bprevious<CR>

" ハイライトを消す。
noremap <Esc><Esc> :<C-u>set nohlsearch<Return>

" 新しく別の単語を検索するときだけハイライトして、nやNでの移動はハイライトしたくない
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" 貼り付けの後「=」でフォーマッティングは面倒なので、いつでもカレント行のインデントにあわせた貼り付けをする。
nnoremap p ]p
nnoremap P ]P

" カーソル位置の単語を置換 s* と打鍵してから置き換え文字を打って /g エンターで発動。
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" レジスタやマークを確認しやすくする。
nnoremap <Space>m :<C-u>marks<Space>
nnoremap <Space>r :<C-u>registers<Space>


" 行末にセミコロンを追加する。
function! IsEndSemicolon()
  let c = getline(".")[col("$")-2]
  if c != ';'
    return 1
  else
    return 0
  endif
endfunction
" inoremap <expr>;; IsEndSemicolon() ? "<C-O>$;<CR>" : "<C-O>$<CR>"
inoremap <expr>;; IsEndSemicolon() ? "<C-O>$;" : "<C-O>$"
nnoremap <expr>;; IsEndSemicolon() ? "$a;<Esc>" : "$"

" vimスクリプト開発用に即バッファをsource。
nnoremap <silent> <Leader>so :<C-u>source %<CR>

"----------------------------------------------------
" 戦闘力を計測
"----------------------------------------------------
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



"----------------------------------------------------
" プラグインの設定
"----------------------------------------------------

"----------------------------------------------------
" showmarks.vim
"  <Leader>mt ON/OFFトグル。
"  <Leader>mm 次の使えるマークを使ってマーク。
"  <Leader>mh カレント行ののマークを削除。
"  <Leader>ma カレントバッファのマークを全部削除。
"----------------------------------------------------
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"help、quickfixと編集不可のバッファについて、マークを表示しない。-
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
"let showmarks_hlline_lower = 1
"let showmarks_hlline_upper = 1

"----------------------------------------------------
" marksbrowser.vim
" ブラウザを開いてエンターでその場所へジャンプ。dでマークを削除。
"----------------------------------------------------
nmap <silent> <leader>mk :MarksBrowser<CR>
" 0:エンター押して選択してもブラウザのバッファを閉じない設定
let marksCloseWhenSelected = 0

"----------------------------------------------------
" NERD commenter
"----------------------------------------------------
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1
" /**/をスペース空けて/* */
let NERDSpaceDelims = 1

"----------------------------------------------------
" NERDTree
"----------------------------------------------------
" カラー表示するか
let NERDChristmasTree = 1
" 起動時に隠しファイルを表示するか（あとで切り替えられる）
let NERDTreeShowHidden = 0
" カーソル行を強調するか
let NERDTreeHighlightCursorline = 1
" NERDTreeウィンドウのサイズ
let NERDTreeWinSize = 50
" NERDTreeウィンドウを横に表示するか上に表示するか
let NERDTreeWinPos = "left"
" <F8>で開く/閉じる
nmap <silent> <F8> :NERDTreeToggle<CR>

let g:NERDTreeHijackNetrw = 0


"----------------------------------------------------
" taglist
"----------------------------------------------------
if has('win32') || has('win64')
  let Tlist_Ctags_Cmd = "ctags"
else
  let Tlist_Ctags_Cmd = "ctags"
  " let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
endif

let Tlist_Inc_Winwidth = 1
"taglistのウィンドーが最後のウィンドーならばVimを閉じる
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
let Tlist_Enable_Fold_Column = 0
" 現在編集中のソースのタグしか表示しない
let Tlist_Show_One_File = 1
" 左右分割ではなく上下分割を使う。
let Tlist_Use_Horiz_Window = 0
let Tlist_WinHeight = 10
" 左右分割の時に右側にだす
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

let tlist_php_settings = 'php;c:class;d:constant;f:function'
" if exists('loaded_taglist')
  nmap <silent> <F9> :TlistToggle<CR>

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

  nmap <silent> <F12>
        \ :!ctags -f %:p:h/tags -R ./<CR>
  " vim --versionで+path_extraが入っていれば
  if has('path_extra')
    " 現ディレクトリ含む親ディレクトリをさかのぼってtagsファイルを指定
    " set tags+=tags;

    " 上だとルートまでさかのぼっちゃうので;以降に特定のディレクトリを指定して、さかのぼり上限を設定。
    " プロジェクトごとに設定できればいいかもな。。。
    " set
    " tags+=tags;/project/a

    " 現在のディレクトリからした全てのtagsを読み込む。
    set tags+=./**/tags;

    " **は30階層が上限なので、上記だと処理が重くなる可能性がある。階層の深さの上限を指定するやりかた。
    " set
    " tags+=./**3/tags;

    " 現在のディレクトリから上はルート、下は全部さかのぼってtagsファイルを読み込む。
    " set
    " tags=**;

  else
    set tags=./tags,tags
  endif

" endif


"----------------------------------------------------
" neocomplcache.vim
"----------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


" Define dictionary.
if has('win32') || has('win64')
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $ME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions',
                \ 'php' : $VIM.'/vimfiles/dict/php.dict',
                \ }
else
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions',
                \ 'php' : $HOME.'/.vim/dict/php.dict',
                \ }
    " ユーザー定義スニペット保存ディレクトリ
    let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
endif

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" undo
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 共通の部分まで補完
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
""\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() ."\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" 補完を選択してポップアップを閉じる。
inoremap <expr><C-y>  neocomplcache#close_popup()
" 補完をキャンセルしてポップアップを閉じる
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
" 補完候補の一番先頭を選択しとく
let g:neocomplcache_enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete


" :NeoComplCacheEditSnippets [filetype]
" ユーザ定義用のスニペットファイルの編集ができる。
" ftを指定しなければ現在のftのスニペットファイルを開く。
" ちなみに、プラグインに組み込まれてるスニペットファイルは下記にある。
" ~/.vim/autoload/neocomplcache/sources/snippets_complete/
nnoremap <silent> <Space>es  :<C-u>NeoComplCacheEditSnippets 

"----------------------------------------------------
" unite.vim
"----------------------------------------------------
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>um :<C-u>Unite file_mru<CR>
nnoremap <silent> <Leader>ul :<C-u>Unite locate<CR>
nnoremap <silent> <Leader>uo :<C-u>Unite outline<CR>
set runtimepath+=~/.vim/plugin/

"----------------------------------------------------
" ref.vim
"----------------------------------------------------
if has('win32') || has('win64')
  let g:ref_phpmanual_path = $VIM . '/vimfiles/manual/php_manual_ja/'
else
  let g:ref_phpmanual_path = $HOME . '/.vim/manual/php_manual_ja/'
endif

"----------------------------------------------------
" scratch.vim
"----------------------------------------------------
nmap <silent> <F5> <Plug>ShowScratchBuffer
imap <silent> <F5> <Plug>InsShowScratchBuffer

" スクラッチバッファを開くマッピングを定義しない
let no_plugin_maps = 1

" vim終了時にスクラッチの内容を保存しておく。
let g:scratchBackupFile=$HOME . "/scratch.txt"


"----------------------------------------------------
" zencoding.vim
"----------------------------------------------------
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
\  'aliases' : {
\    'req' : 'require '
\  },
\  'snippets' : {
\    'use' : "use strict\nuse warnings\n\n",
\    'warn' : "warn \"|\";",
\  }
\}
\}


"----------------------------------------------------
" cake.vim
"----------------------------------------------------
nnoremap <Space>cc :Ccontroller
nnoremap <Space>cm :Cmodel
nnoremap <Space>cv :Cview
nnoremap <Space>cl :Clog 
nnoremap <Space>ccv :Ccontrollerview
nnoremap <Space>ccf :Cconfig
nnoremap <Space>ccm :Ccomponent
nnoremap <Space>cs :Cshell
nnoremap <Space>ct :Ctask

"----------------------------------------------------
" localrc.vim
"----------------------------------------------------
call localrc#load('.init.vimrc', $HOME)

"----------------------------------------------------
" gist.vim
"----------------------------------------------------
let g:gist_privates = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_put_url_to_clipboard_after_post = 1
