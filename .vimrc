set nocompatible
set background=dark
syntax on
set number
filetype plugin indent on

" Colors
colorscheme gruvbox-material

" Hit F4 to highlight current line
nnoremap <silent> <F4> :set cursorline!<CR>

" Set tabs as spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Navigate through buffer list
nnoremap <silent> [b :bprevious<CR> 
nnoremap <silent> ]b :bnext<CR> 
nnoremap <silent> [B :bfirst<CR> 
nnoremap <silent> ]B :blast<CR>

" Visual enhancements
set hlsearch!
set cursorline

