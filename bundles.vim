" vim:set ts=4 sts=2 sw=2 tw=0 ft=vim fdm=marker:

filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()

" help {{{
Bundle 'vim-jp/vimdoc-ja'
" }}}

" utility {{{
" Bundle 'taglist.vim' " tab切り替え時にエラーが出るので下記fix版を使う。
Bundle 'rgo/taglist.vim'
" Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'matchit.zip'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
" Bundle 'Townk/vim-autoclose'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-localrc'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'scratch-utility'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'dbext.vim'
Bundle 'motemen/hatena-vim'
Bundle 'PDV--phpDocumentor-for-Vim'
" Bundle 'kana/vim-smartchr'
" Bundle 'kana/vim-smartinput'
Bundle 'kana/vim-textobj-user'
Bundle 'akiyan/vim-textobj-php'
Bundle 'vim-scripts/Align'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SQLUtilities'
Bundle 'tomtom/checksyntax_vim'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'kien/ctrlp.vim'
Bundle 'glidenote/memolist.vim'
Bundle 'vim-scripts/Modeliner'
" }}}

" framework {{{
Bundle 'tpope/vim-rails'
Bundle 'violetyk/cake.vim'
Bundle 'naberon/vim-cakehtml'
" }}}

" unite source {{{
Bundle 'unite-colorscheme'
Bundle 'unite-locate'
Bundle 'h1mesuke/unite-outline'
Bundle 'tacroe/unite-mark'
Bundle 'zhaocai/unite-scriptnames'
" Bundle 'osyo-manga/unite-moo'
" }}}

" colorscheme {{{
Bundle 'desert.vim'
Bundle 'desert256.vim'
Bundle 'mrkn256.vim'
Bundle 'molokai'
Bundle 'Zenburn'
Bundle 'altercation/vim-colors-solarized'
" }}}

" syntax {{{
" Bundle 'php.vim--Garvin'
Bundle 'StanAngeloff/php.vim'
Bundle 'jQuery'
Bundle 'JavaScript-syntax'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
" }}}

" indent {{{
Bundle 'pangloss/vim-javascript'
" }}}
