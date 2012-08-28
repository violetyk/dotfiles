" 文字列中のSQLをハイライトする
let php_sql_query = 1

" 文字列中のHTMLをハイライトする
let php_htmlInStrings = 1

" ] や ) の対応エラーをハイライトする
let php_parent_error_close = 1

" 対応する閉じ括弧がない開き括弧( や [が存在する場合、php終了タグをスキップさせる
let php_parent_error_open = 1

" ショートタグ (<?を無効にする→ハイライト除外にする)
" let php_noShortTags = 0

" クラスと関数の折りたたみ(folding)を有効にする
" let php_folding = 1
let php_folding = 0

" :make で文法チェックする-> quickfixsigns_vimを使うようにした
" if has('win32') || has('win64')
" else
    " " set makeprg=/usr/local/php/bin/php\ -l\ %
    " set makeprg=php\ -l\ %
" endif
" set errorformat=%m\ in\ %f\ on\ line\ %l

if has('win32') || has('win64')
    let g:ref_phpmanual_path = $VIM . '/vimfiles/manual/php_manual_ja/'
else
    let g:ref_phpmanual_path = $HOME . '/.vim/manual/php_manual_ja/'
endif
