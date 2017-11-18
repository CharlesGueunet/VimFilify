" File: Filify.vim
" Author: Charles Gueunet
" Description: Load a config file in a variable.
" Last Modified: November 14, 2017

function! Filify#process(...) abort
   let filename   = (a:0 >= 1)? a:1 : g:filify_filename
   let recurse    = (a:0 >= 2)? a:2 : g:filify_recurse
   let sep        = (a:0 >= 3)? a:3 : g:filify_sep
   let workingdir = (a:0 >= 4)? a:4 : getcwd()

   let foundFile = globpath(workingdir, filename)

   if foundFile != ""
      return Filify#file2var(foundFile, sep)
   elseif recurse != 0
      let parent = Filify#parent(workingdir)
      if parent == "/"
         " stop at the root
         let recurse = 0
      endif
      return Filify#process(filename, recurse, sep, parent)
   endif

   " file not found
   return 0
endfunction
