" 文字列中のSQLをハイライトする
let php_sql_query = 1

" 文字列中のHTMLをハイライトする
let php_htmlInStrings = 1

" ショートタグ (<?を無効にする→ハイライト除外にする)
let php_noShortTags = 1

" クラスと関数の折りたたみ(folding)を有効にする
" let php_folding = 1
let php_folding = 0

" :make で文法チェックする
if has('win32') || has('win64')
    
else
    " set makeprg=/usr/local/php/bin/php\ -l\ %
    set makeprg=php\ -l\ %
endif

set errorformat=%m\ in\ %f\ on\ line\ %l

if has('win32') || has('win64')
    let g:ref_phpmanual_path = $VIM . '/vimfiles/manual/php_manual_ja/'
else
    let g:ref_phpmanual_path = $HOME . '/.vim/manual/php_manual_ja/'
endif
