set nocompatible
set smartindent
set autoindent
set paste

let mapleader=" "

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

map <F8> magg"*yG'a

set bg=light
" equals signs should not be part of a filename
" This makes Ctrl-X Ctrl-F work correctly in shell scripts
" with lines such as:
" set FOO=/Users/nate/blah<cursor here> 
set isfname-==

" Copy current filename to clipboard
" https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
map <leader>cp :let @" = expand("%:p")<CR>

filetype on
filetype plugin on
filetype indent on
syntax enable
set hidden
set nowrap
set ignorecase
set smartcase
set expandtab
set tabstop=4
set shiftwidth=4
" Show statusline always
set laststatus=2
" Set backup directory other than current dir.
set directory=~/tmp,/tmp

" Don't prompt to save text read from STDIN
au StdinReadPost * set buftype=nofile

map <leader>1 <C-W>o<CR>
map <leader>k :bd<CR>
map <leader>a :Ack 
map <leader>e :e .<CR>
map <leader>f :e .<CR>
map <leader>p :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader><leader> <C-^>
map <leader>n :bn<CR>
map <leader>mii :r ~/src/vim_templates/img_foil.xml<CR>
map <leader>mil :r ~/src/vim_templates/itemizedlist.xml<CR>
map <leader>miv :r ~/src/vim_templates/var_thing.xml<CR>
map <leader>mit :r ~/src/vim_templates/table_thing.xml<CR>
map <leader>mif :r ~/src/vim_templates/foil.xml<CR>
map <leader>mip :r ~/src/vim_templates/programlisting.xml<CR>

" map <C-h> <C-W>h
map h <C-W>h

" map <C-k> <C-W>k
map k <C-W>k

" map <C-j> <C-W>j
map j <C-W>j

" map <C-l> <C-W>l
map l <C-W>l

" Python
autocmd FileType python nnoremap <buffer> <F5> :update<bar>!python3 %<CR>

" Plugin-specific settings {{{1
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw=0

function! TmuxMove(direction)
        let wnr = winnr()
        silent! execute 'wincmd ' . a:direction
        " If the winnr is still the same after we moved, it is the last pane
        if wnr == winnr()
                call system('tmux select-pane -t '  . shellescape($TMUX_PANE) . ' -' . tr(a:direction, 'phjkl', 'lLDUR'))
        end
endfunction

" nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> h :call TmuxMove('h')<cr>
" nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> j :call TmuxMove('j')<cr>
" nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> k :call TmuxMove('k')<cr>
" nnoremap <silent> <c-l> :call TmuxMove('l')<cr>
nnoremap <silent> l :call TmuxMove('l')<cr>

let g:ctrlp_types = [ 'fil', 'buf', 'mru' ]
let g:ctrlp_cmd = 'CtrlPCurWD'

" https://realpython.com/vim-and-python-a-match-made-in-heaven/#code-folding
au BufNewFile,BufRead *.py
    \let barf="tr"
    \set tab      stop            =4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix
" Load matchit plugin
runtime macros/matchit.vim

" Wow this is absolutely stupid trying to get this to work in
" iTerm2.  See https://apple.stackexchange.com/questions/281033/sending-ctrlfunction-key-on-iterm2
autocmd FileType sh map <F5> :up<CR><Bar>:!./%<CR>
autocmd FileType sh map <C-F5> :up<CR><Bar>:execute '!./% ' . getreg("p")<CR>

let g:xml_syntax_folding=1
augroup xml 
    au!
    au FileType xml setlocal foldmethod=syntax
    au FileType xml setlocal foldtext=MyFoldText()
    au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -
    au FileType xml setlocal makeprg=xmllint\ --noout\ %
augroup END

function! MyFoldText()
    let line = getline(v:foldstart + 1)
    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    return sub
endfunction

map <F9> :up<CR>

" Hightlight cursor line
set cursorline
hi CursorLine ctermbg=LightGrey
" Get rid of silly underline for current cursor line
hi CursorLine term=None
hi CursorLine cterm=None
set nocursorline
map [1;5B <C-down>
map <C-down> :cn<CR>
map [1;5A <C-up>
map <C-up> :cp<CR>
map [1;5D <C-left>
map [1;5C <C-right>
map <C-left> :cold<CR>
map <C-right> :cnew<CR>

map [1;6A <C-S-up>
map <C-S-up> :cpf<CR>
map [1;6B <C-S-down>
map <C-S-down> :cnf<CR>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

" Run the make program and get rid of prompts
map <F5> :up<CR>:make<CR><CR>
