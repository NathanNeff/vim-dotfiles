runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set bg=light
" equals signs should not be part of a filename
" This makes Ctrl-X Ctrl-F work correctly in shell scripts
" with lines such as:
" set FOO=/Users/nate/blah<cursor here> 
set isfname-==

filetype plugin indent on
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
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-l> <C-W>l

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

nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

let g:ctrlp_types = [ 'fil', 'buf' ]
let g:ctrlp_cmd = 'CtrlPCurWD'

" Load matchit plugin
" runtime macros/matchit.vim
