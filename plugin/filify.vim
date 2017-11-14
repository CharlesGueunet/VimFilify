" File: filify.vim
" Author: Charles Gueunet
" Description: Load a config file in a variable.
" Last Modified: November 14, 2017

" Name of the config file searched in the lookup
if(!exists("g:filify_filename"))
   let g:filify_filename = "filify.conf"
endif

" Name of the receiving variable
if(!exists("g:filify_recurse"))
   let g:filify_recurse = 1
endif

function! Filify(...)
   let filename = (a:0 >= 1)? a:1 : g:filify_filename
   let recurse  = (a:0 >= 2)? a:2 : g:filify_recurse
endfunction

