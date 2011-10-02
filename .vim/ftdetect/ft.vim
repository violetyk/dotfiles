" CakePHP
au! BufNewFile,BufRead *.ctp setf php

" Drupal
au! BufNewFile,BufRead *.inc setf php
au! BufNewFile,BufRead *.info setf php
au! BufNewFile,BufRead *.module setf php
au! BufNewFile,BufRead *.install setf php

" Smarty
au! BufNewFile,BufRead *.tpl setf php

" Objective-C
au! BufNewFile,BufRead *.m setf objc
au! BufNewFile,BufRead *.h setf objc

" jQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
