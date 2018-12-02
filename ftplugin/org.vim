function! OrgModeLevel()
    if getline(v:lnum) =~ '^\* .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^\*\* .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^\*\*\* .*$'
        return ">3"
    endif
    return "=" 
endfunction
" Set syntax highlighting for markdown
hi Title ctermfg=darkblue
hi! link Folded Title
set foldtext=OrgFoldText()
function! OrgFoldText()
    setlocal fillchars-=fold:-
    return getline(v:foldstart) . " " . v:folddashes 
endfunction
setlocal foldexpr=OrgModeLevel()  
setlocal foldmethod=expr  
