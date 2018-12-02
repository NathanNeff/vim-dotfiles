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

" Don't print the annoying ------ when line is folded
setlocal fillchars-=fold:-

" Set syntax highlighting for markdown
hi Title ctermfg=darkblue
hi! link Folded Title

set foldtext=OrgFoldText()
function! OrgFoldText()
    return getline(v:foldstart) . " +"
endfunction

setlocal foldexpr=OrgModeLevel()  
setlocal foldmethod=expr  
