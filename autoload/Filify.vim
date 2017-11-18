" File: Filify.vim
" Author: Charles Gueunet
" Description: Load a config file in a variable.
" Last Modified: November 14, 2017

function! Filify#process(...) abort
   let filename   = (a:0 >= 1)? a:1 : g:filify_filename
   let recurse    = (a:0 >= 2)? a:2 : g:filify_recurse
   let workingdir = (a:0 >= 3)? a:3 : getcwd()

   let foundFile = globpath(workingdir, filename)

   if foundFile != ""
      call Filify#file2var(foundFile)
   elseif recurse != 0
      let parent = Filify#parent(workingdir)
      if parent == "/"
         " stop at the root
         let recurse = 0
      endif
      call Filify#process(filename, recurse, parent)
   endif
endfunction

function! Filify#file2var(file) abort
   echom a:file
endfunction
