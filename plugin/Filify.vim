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

" Recusively look into the parent directory
" until the config file is found (stop at the root)
if(!exists('g:filify_recurse'))
   let g:filify_recurse = 1
endif

" Which separator to use when storing the file
" into the variable
if(!exists('g:filify_sep'))
   let g:filify_sep = ' '
endif

" Which string to return if no file has been found
" usefull for default options
if(!exists('g:filify_default_return'))
   let g:filify_default_return = ' '
endif

" Functions
"""""""""""

" Main processing
function! Filify#process_main(filename, recurse, sep, default_return, dir) abort

   let l:foundFile = globpath(a:dir, a:filename)
   let l:continue = a:recurse

   if l:foundFile !=# ''
      return Filify#file2var(l:foundFile, a:sep)
   elseif l:continue != 0
      let l:parent = Filify#parent(a:dir)
      if l:parent ==# '/'
         " stop at the root
         let l:continue = 0
      endif
      return Filify#process_main(a:filename, l:continue, a:sep, a:default_return, l:parent)
   endif

   " file not found
   return a:default_return
endfunction

" Go to parent
function! Filify#parent(path)
   return fnamemodify(a:path, ':p:h:h')
endfunction

" Store a file into a variable
function! Filify#file2var(file, ...)
   let l:sep = (a:0 >= 1)? a:1 : ' '
   return join(readfile(a:file), l:sep)
endfunction
