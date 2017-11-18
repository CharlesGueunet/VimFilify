" File: Filify.vim
" Author: Charles Gueunet
" Description: Load a config file in a variable.
" Last Modified: November 14, 2017

" Variables
"""""""""""

" This variable are not mandatory as the process function
" is may receive everything as parameters.
" This behaviour allows to use this plugin with differents
" parameters several times.
" Global variables are just for non advanced use.

" Name of the config file searched in the lookup
if(!exists("g:filify_filename"))
   let g:filify_filename = "filify.conf"
endif

" Recusively look into the parent directory
" until the config file is found (stop at the root)
if(!exists("g:filify_recurse"))
   let g:filify_recurse = 1
endif

" Functions
"""""""""""

function! Filify#parent(path)
   return fnamemodify(a:path, ":p:h:h")
endfunction
