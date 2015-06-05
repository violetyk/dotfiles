setlocal  path+=$GOPATH/src/**
let g:gofmt_command = 'goimports'

augroup Golang
  autocmd!
  autocmd BufWritePre *.go Fmt
  autocmd BufNewFile,BufRead *.go setlocal sw=2 noexpandtab ts=2 completeopt=menu,preview
  autocmd FileType go compiler go | let g:neocomplete#enable_auto_close_preview = 0
augroup END

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
