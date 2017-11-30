" File: Filify.vim
" Author: Charles Gueunet
" Description: Load a config file in a variable.
" Last Modified: November 30, 2017

" Example
" let g:config = Filify#process(".myconf")
"
" For ale:
" let g:ale_cpp_clang_options = Filify#process(".clang_config", {'default_return':'-std=c++14'})

function! Filify#process(filename, ...) abort
   if a:0 >= 1
      if type(a:1) == v:t_dict 
         let l:params = a:1
      else
         echom 'VimFilify: bad args in Filify#process, need a dictionary'
      endif
   else
      let l:params = {}
   endif

   if !has_key(l:params, 'recurse')
      let l:params.recurse = g:filify_recurse
   endif

   if !has_key(l:params, 'sep')
      let l:params.sep = g:filify_sep
   endif

   if !has_key(l:params, 'default_return')
      let l:params.default_return = g:filify_default_return
   endif

   if !has_key(l:params, 'dir')
      let l:params.dir =  getcwd()
   endif

   return Filify#process_main(a:filename, l:params.recurse, l:params.sep, l:params.default_return, l:params.dir)
endfunction
