set hidden
set nowrap
" Don't prompt to save text read from STDIN
au StdinReadPost * set buftype=nofile

let mapleader=","
map <leader>d :bd<CR>
map <Space> :bn<CR>
