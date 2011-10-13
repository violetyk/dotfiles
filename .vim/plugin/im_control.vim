"=============================================================================
"    Description: 日本語入力固定モード(JpFixMode)
"                 IME/IM Control (Windows/linux)
"                 https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control
"     Maintainer: fuenor@gmail.com
"  Last Modified: 2011-07-04 21:50
"        CAUTION: IBus+Pythonが使える環境以外ではxvkbd等が必要になります
"        Version: 1.07
"=============================================================================
scriptencoding utf-8
if exists('loaded_IM_Control') && !exists('fudist')
  finish
endif
let loaded_IM_Control = 1

""""""""""""""""""""""""""""""
" オプション
""""""""""""""""""""""""""""""
" IM制御モード
if !exists('g:IM_CtrlMode')
  let g:IM_CtrlMode = 1
endif
" IM制御モード(IM_CtrlMode)の設定
" ---------------------------------------------------
" | 0 | 何もしない                                    |
" ---------------------------------------------------
" * IM制御が一切行えない場合
" ---------------------------------------------------
" | 1 | On/Off個別制御                                |
" ---------------------------------------------------
" * IM On/Offが個別制御できる場合
" ---------------------------------------------------
" | 2 | JpFixMode制御のみ                             |
" | 3 | JpFixMode制御+疑似vi協調モード(JpFixMode専用) |
" ---------------------------------------------------
" * IM制御が Toggleしか使用できない場合の補助
"   2 : 挿入モードへの移行時のみJpFixMode制御を行う。
"   3 : JpFixModeが Onなら、挿入モードでは常に IM Onと
"       仮定して、ーマルモードへの移行時に Toggleを実行。
" ---------------------------------------------------
" | 4 | <C-^>でIM制御が行える場合
" ---------------------------------------------------
" * <C-^>でIM制御が行える場合

if g:IM_CtrlMode == 0
  finish
endif

" JpFixModeの vi協調モードを使用する
if !exists('g:IM_vi_CooperativeMode')
  let g:IM_vi_CooperativeMode = 1
endif
" 外部スクリプトを実行する際に非同期で呼び出す。
if !exists('IM_CtrlAsync')
  let IM_CtrlAsync = '&'
  if !has('gui_running')
    " Vim(非GUI)ならデフォルトは同期処理
    let IM_CtrlAsync = ''
  endif
endif
" IM制御がToggleしか行えない時、JpFixMode切替時に Toggleも実行する。
" JpFixMode切替を行う時は現在のIMモードと逆にしたい時が多いと仮定している。
if !exists('g:IM_JpFixModeAutoToggle')
  let IM_JpFixModeAutoToggle = 1
endif

"""""""""""""""""""""""""""""
" Pythonを使用して IBusの制御
"
" IBusを :call PyIBusToggle() で切替可能可能な場合に使用する関数群
" CAUTION: current_input_contxt は current_input_context のtypoと思われる
"          IBusのアップデートで修正されるかもしれないので要注意

" IBusのPythonによる制御方法指定
" ---------------------------------------------------
"   0 : 使用しない
"   1 : Pythonインターフェイスか自動生成した外部スクリプトを使用する
"   2 : すべてPythonインターフェイス制御を使用する
" ---------------------------------------------------
" 1の場合、VimのPythonインターフェイスが無効であれば、
" 外部Pythonスクリプトを自動生成して使用する
" なおファイルの生成先が空文字列の場合、外部スクリプトは生成されない
if !exists('IM_CtrlIBusPython')
  let IM_CtrlIBusPython = 0
endif
" 自動生成するファイルの保存場所
if !exists('IM_CtrlIBusPythonFileDir')
  let IM_CtrlIBusPythonFileDir = fnamemodify(tempname(), ':h')
endif
" 使用するPythonのバージョン
if !exists('g:IM_CtrlIBusPythonVer')
  let g:IM_CtrlIBusPythonVer = 'python'
  if !has('python') && has('python3')
    let g:IM_CtrlIBusPythonVer = 'python3'
  endif
endif

if IM_CtrlIBusPython != 1
  let IM_CtrlIBusPythonFileDir = ''
endif

" モードフック
augroup InsertHookIM
  autocmd!
  autocmd InsertEnter * call IMState('Enter')
  autocmd InsertLeave * call IMState('Leave')
augroup END

""""""""""""""""""""""""""""""
" IM制御用関数サンプル(要xvkbd)
" 環境に合わせたIM制御を行う必要がある場合は
" .vimrcで IMCtrl(cmd)を定義します。
""""""""""""""""""""""""""""""
" function! IMCtrl(cmd)
"   let cmd = a:cmd
"   if cmd == 'On'
"     let res = system('xvkbd -text "\[Control]\[Shift]\[Insert]" > /dev/null 2>&1 ')
"   elseif cmd == 'Off'
"     let res = system('xvkbd -text "\[Control]\[Shift]\[Delete]" > /dev/null 2>&1 ')
"   elseif cmd == 'Toggle'
"     let res = system('xvkbd -text "\[Control]\[space]" > /dev/null 2>&1 ')
"   endif
"   return ''
" endfunction

""""""""""""""""""""""""""""""
" main
""""""""""""""""""""""""""""""
if !exists('g:IMState')
  let g:IMState = 0
endif
silent! function IMState(cmd)
  if g:IM_CtrlMode == 0
    return ''
  endif
  let cmd = a:cmd
  if cmd == 'Enter'
    if g:IMState
      let cmd = g:IM_CtrlMode == 1 ? 'On' : 'Toggle'
      if g:IM_CtrlIBusPython
        let cmd = ''
        call PyIBusEnableEx()
      endif
    endif
  elseif cmd == 'Leave'
    if g:IM_vi_CooperativeMode == 0
      return ''
    endif
    let cmd = g:IM_CtrlMode == 1 ? 'Off' : ''
    if g:IM_CtrlMode == 3 && g:IMState
      " 疑似vi協調モード
      let cmd = 'Toggle'
    endif
  elseif cmd == 'FixMode'
    let g:IMState = g:IMState == 0 ? 2 : 0
    let cmd = g:IMState ? 'On' : 'Off'
    redraw| echo 'JpFixMode : '.cmd
    if g:IM_CtrlMode != 1
      if g:IM_JpFixModeAutoToggle == 0
        return ''
      endif
      let cmd = 'Toggle'
    endif
  endif
  call IMCtrl(cmd)
  return ''
endfunction

""""""""""""""""""""""""""""""
" IM制御用関数(デフォルト)
silent! function IMCtrl(cmd)
  let cmd = a:cmd
  if cmd == 'On'
    let res = system('xvkbd -text "\[Control]\[Shift]\[Insert]" > /dev/null 2>&1 '.g:IM_CtrlAsync)
  elseif cmd == 'Off'
    let res = system('xvkbd -text "\[Control]\[Shift]\[Delete]" > /dev/null 2>&1 '.g:IM_CtrlAsync)
  elseif cmd == 'Toggle'
    let res = system('xvkbd -text "\[Control]\[space]" > /dev/null 2>&1 '.g:IM_CtrlAsync)
  endif
  return ''
endfunction

""""""""""""""""""""""""""""""
" PythonでIBusの制御
if IM_CtrlIBusPython
  function! IMCtrl(cmd)
    let cmd = a:cmd
    if cmd == 'On'
      call PyIBusEnable()
    elseif cmd == 'Off'
      call PyIBusDisable()
    elseif cmd == 'Toggle'
      call PyIBusToggle()
    endif
    return ''
  endfunction
endif

function! PyIBusEnable()
exec g:IM_CtrlIBusPythonVer.' << EOF'
import ibus
bus = ibus.Bus()
ic  = ibus.InputContext(bus, bus.current_input_contxt())
ic.enable()
EOF
endfunction

function! PyIBusDisable()
exec g:IM_CtrlIBusPythonVer.' << EOF'
import ibus
bus = ibus.Bus()
ic  = ibus.InputContext(bus, bus.current_input_contxt())
ic.disable()
EOF
endfunction

function! PyIBusToggle()
exec g:IM_CtrlIBusPythonVer.' << EOF'
import ibus
bus = ibus.Bus()
ic  = ibus.InputContext(bus, bus.current_input_contxt())
if ic.is_enabled():
  ic.disable()
else:
  ic.enable()
EOF
endfunction

" IBusのvi協調モード対策にInsertEnter時に使用するIM有効化コマンド
silent! function PyIBusEnableEx()
  " 外部をコマンドを実行するなら & を付けて非同期で実行すること
  call IMCtrl('On')
endfunction

" Pythonインターフェイスのチェック
if !has(g:IM_CtrlIBusPythonVer)
  let IM_CtrlIBusPython = 0
endif

" 非GUIならファイル生成不要
if !has('gui_running') && IM_CtrlIBusPython
  let g:IM_CtrlIBusPythonFileDir = ''
endif

let s:pydir = expand(g:IM_CtrlIBusPythonFileDir)
if g:IM_CtrlIBusPythonFileDir != ''
  if isdirectory(s:pydir) == 0
    call mkdir(s:pydir, 'p')
  endif
  let s:pyfile = s:pydir . '/ibus-enable.py'
  if !filereadable(s:pyfile)
    call writefile(['import ibus', 'bus = ibus.Bus()', 'ic = ibus.InputContext(bus, bus.current_input_contxt())', 'ic.enable()'], expand(s:pyfile))
  endif
endif

if g:IM_CtrlIBusPython == 0 && g:IM_CtrlIBusPythonFileDir != ''
  " Pythonインターフェイスが無効
  let s:pyfile = s:pydir . '/ibus-disable.py'
  if !filereadable(s:pyfile)
    call writefile(['import ibus', 'bus = ibus.Bus()', 'ic = ibus.InputContext(bus, bus.current_input_contxt())', 'ic.disable()'], expand(s:pyfile))
  endif
  let s:pyfile = s:pydir . '/ibus-toggle.py'
  if !filereadable(s:pyfile)
    call writefile(['import ibus', 'bus = ibus.Bus()', 'ic = ibus.InputContext(bus, bus.current_input_contxt())', 'if ic.is_enabled():', '  ic.disable()', 'else:', '  ic.enable()'], expand(s:pyfile))
  endif
  function! PyIBusEnable()
    let res = system('python '.s:pydir.'/ibus-enable.py '.g:IM_CtrlAsync)
  endfunction
  function! PyIBusDisable()
    let res = system('python '.s:pydir.'/ibus-disable.py '.g:IM_CtrlAsync)
  endfunction
  function! PyIBusToggle()
    let res = system('python '.s:pydir.'/ibus-toggle.py '.g:IM_CtrlAsync)
  endfunction
  function! PyIBusEnableEx()
    call PyIBusEnable()
  endfunction
elseif g:IM_CtrlIBusPython == 1 && has('gui_running') && g:IM_CtrlIBusPythonFileDir != ''
  function! PyIBusEnableEx()
    let res = system('python '.s:pydir.'/ibus-enable.py '.g:IM_CtrlAsync)
  endfunction
endif

""""""""""""""""""""""""""""""
" 非GUIではすぐに切り替わらない対策
if !has('gui_running')
  silent! inoremap <silent> <ESC> <ESC>
  silent! inoremap <silent> <C-[> <ESC>
endif

" For your eyes only.
if exists('g:fudist')
  inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
endif

if has('unix') && IM_CtrlMode != 4
  finish
endif

"----------------------------------------
"for Windows / <C-^>
"----------------------------------------
silent! inoremap <silent> <unique> <ESC> <ESC>
silent! inoremap <silent> <unique> <C-[> <ESC>

function! IMState(cmd)
  let cmd = a:cmd
  if cmd == 'Enter'
    let &iminsert = g:IMState
  elseif cmd == 'Leave'
    let g:IMState = &iminsert
    set iminsert=0 imsearch=0
  elseif cmd == 'FixMode'
    echo 'JpFixMode : ' . (&iminsert == 2 ? 'On' : 'Off')
  endif
  return ''
endfunction

" For your eyes only.
if exists('g:fudist')
  inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
endif

