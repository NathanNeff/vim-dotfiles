set nocompatible
set smartindent
set autoindent
set paste

let mapleader=" "

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set bg=light
" equals signs should not be part of a filename
" This makes Ctrl-X Ctrl-F work correctly in shell scripts
" with lines such as:
" set FOO=/Users/nate/blah<cursor here> 
set isfname-==

" Copy current filename to clipboard
" https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
map <leader>cp :let @" = expand("%:p")<CR>

filetype plugin on
filetype indent on
syntax enable
set smartindent
set nocompatible
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

let mapleader=","
map <leader>d :bd<CR>
map <leader>f :w<CR>
map <Space> :bn<CR>

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

let g:ctrlp_types = [ 'fil', 'buf' ]
let g:ctrlp_cmd = 'CtrlPCurWD'

" https://realpython.com/vim-and-python-a-match-made-in-heaven/#code-folding
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix
" Load matchit plugin
runtime macros/matchit.vim
