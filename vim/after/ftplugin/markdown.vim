setlocal autoindent
setlocal formatoptions=tcroqln
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-
set fdm=marker

abbreviate td [ ]
abbreviate tl - [ ]

nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>
vnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

function! ToggleCheckbox()
  let l:line = getline('.')
  if l:line =~ '\-\s\[\s\]'
    let l:result = substitute(l:line, '-\s\[\s\]', '- [x]', '')
    call setline('.', l:result)
  elseif l:line =~ '\-\s\[x\]'
    let l:result = substitute(l:line, '-\s\[x\]', '- [ ]', '')
    call setline('.', l:result)
  end
endfunction

" markdown syntaxは syn include に対応している
let g:markdown_fenced_languages = [
      \ 'coffee',
      \ 'css',
      \ 'erb=eruby',
      \ 'javascript',
      \ 'js=javascript',
      \ 'json=javascript',
      \ 'ruby',
      \ 'sass',
      \ 'xml',
      \ 'php',
      \]