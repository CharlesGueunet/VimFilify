" File: Filify.vim
" Author: Charles Gueunet
" Description: Load a config file in a variable.
" Last Modified: November 14, 2017

" Example
"""""""""

" let g:config = Filify#process(".myconf")
"
" For ale:
" let g:ale_cpp_clang_options = Filify#process(".clang_config", {'default_return':'-std=c++14'})
"
" Check if file exists:
" let g:file_to_process = Filify#process(".myconf", {'check_only':1})

" Tools
"""""""""""

" Go to parent
function! Filify#parent(path)
   return fnamemodify(a:path, ':p:h:h')
endfunction

" Store a file into a variable
function! Filify#file2var(file, ...)
   let l:sep = (a:0 >= 1)? a:1 : ' '
   return join(readfile(a:file), l:sep)
endfunction
