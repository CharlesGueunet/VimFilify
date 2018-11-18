" File: Filify.vim
" Author: Charles Gueunet
" Description: Load a config file in a variable.
" Last Modified: November 30, 2017

" Example
" let g:config = Filify#process(".myconf")
"
" For ale:
" let g:ale_cpp_clang_options = Filify#process(".clang_config", {'default_return':'-std=c++14'})
"
" Check if file exists:
" let g:file_to_process = Filify#process(".myconf", {'check_only':1})

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
      let l:params.recurse = 1
   endif

   if !has_key(l:params, 'sep')
      let l:params.sep = ' '
   endif

   if !has_key(l:params, 'default_return')
      let l:params.default_return = ' '
   endif

   if !has_key(l:params, 'dir')
      let l:params.dir =  getcwd()
   endif

   if has_key(l:params, 'check_only')
      let l:params.check_only = 1
   else
      let l:params.check_only = 0
   endif

   return Filify#process_main(a:filename, l:params.check_only, l:params.recurse, l:params.sep, l:params.default_return, l:params.dir)
endfunction

function! Filify#process_main(filename, check_only, recurse, sep, default_return, dir) abort

   let l:foundFile = globpath(a:dir, a:filename)
   let l:continue = a:recurse

   if l:foundFile !=# ''
      " file found
      if a:check_only
         return 1
      else
         return Filify#file2var(l:foundFile, a:sep)
      endif
   elseif l:continue != 0
      " go up
      let l:parent = Filify#parent(a:dir)
      if l:parent ==# '/'
         " stop at the root
         let l:continue = 0
      endif
      return Filify#process_main(a:filename, a:check_only, l:continue, a:sep, a:default_return, l:parent)
   endif

   " file not found
   if a:check_only
      return 0
   else
      return a:default_return
   endif
endfunction

