set nocompatible
set cmdheight=2
set updatetime=300
set shortmess+=c
set nohlsearch
set clipboard+=unnamedplus

let mapleader=","
let leader=","

source ~/.config/nvim/neovim.vim

let g:user_emmet_leader_key=','
let g:NERDCustomDelimiters = { 'htmldjango': { 'left': '<!--','right': '-->' } }

" Movement
nmap j gj
xmap j gj
omap j gj

nmap k gk
xmap k gk
omap k gk

nmap <C-h> g^
xmap <C-h> g^
omap <C-h> g^

nmap <C-l> g$
xmap <C-l> g$
omap <C-l> g$

nmap <C-j> 8gj
nmap <C-k> 8gk
xmap <C-j> 8gj
xmap <C-k> 8gk
omap <C-j> 8gj
omap <C-k> 8gk

nmap + 10<C-w>>
nmap _ 10<C-w><
