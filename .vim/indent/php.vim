setlocal iskeyword-=$

" オートインデント
"setlocal noautoindent
setlocal autoindent

" タブはハードタブとして入力する
" setlocal noexpandtab

" タブは空白として入力する（実際にTABを入力したい場合は<C-V><TAB>）
setlocal expandtab

" タブが対応する空白の数
setlocal tabstop=4

" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
setlocal softtabstop=4

" インデントの各段階に使われる空白の数
setlocal shiftwidth=4
