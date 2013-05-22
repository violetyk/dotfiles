augroup Snippet
  autocmd!
  autocmd BufWritePost * execute ':NeoSnippetMakeCache ' . expand('%:t:r')
augroup END
