function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
" Set syntax highlighting for markdown
hi Title ctermfg=darkblue
hi! link Folded Title
" Don't print the annoying ------ when line is folded
setlocal fillchars-=fold:-

set foldtext=MarkdownFoldText()
function! MarkdownFoldText()
    return getline(v:foldstart) . " +"
endfunction

setlocal foldexpr=MarkdownLevel()  
setlocal foldmethod=expr  
