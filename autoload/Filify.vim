" File: Filify.vim
" Author: Charles Gueunet
" Description: Load a config file in a variable.
" Last Modified: November 14, 2017

function! Filify#process(...) abort
    let l:filename   = (a:0 >= 1)? a:1 : g:filify_filename
    let l:recurse    = (a:0 >= 2)? a:2 : g:filify_recurse
    let l:sep        = (a:0 >= 3)? a:3 : g:filify_sep
    let l:return     = (a:0 >= 4)? a:4 : g:default_return
    let l:workingdir = (a:0 >= 5)? a:5 : getcwd()

    let l:foundFile = globpath(l:workingdir, l:filename)

    if l:foundFile !=# ''
        return Filify#file2var(l:foundFile, l:sep)
    elseif l:recurse != 0
        let l:parent = Filify#parent(l:workingdir)
        if l:parent ==# '/'
            " stop at the root
            let l:recurse = 0
        endif
        return Filify#process(l:filename, l:recurse, l:sep, l:return, l:parent)
    endif

    " file not found
    return g:default_return
endfunction
