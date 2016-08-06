runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on
syntax enable
set nocompatible
set hidden
set nowrap
set ignorecase
set smartcase
" Don't prompt to save text read from STDIN
au StdinReadPost * set buftype=nofile

let mapleader=","
map <leader>d :bd<CR>
map <leader>f :w<CR>
map <Space> :bn<CR>
map <F2> :NERDTreeToggle<CR>
