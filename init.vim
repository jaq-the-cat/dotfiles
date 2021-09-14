set encoding=utf-8
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
filetype indent off
filetype plugin indent on
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set number
set signcolumn=number
set nohlsearch
set termguicolors

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let mapleader=","
let leader=","

call plug#begin()
" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utility
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'svermeulen/vim-easyclip' " mm and black hole dd
Plug 'matze/vim-move' " move lines and characters around

" Themes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'marko-cerovac/material.nvim'
Plug 'EdenEast/nightfox.nvim'
call plug#end()

" Movement
nnoremap j gj
xnoremap j gj
onoremap j gj

nnoremap k gk
xnoremap k gk
onoremap k gk

nnoremap <C-h> g^
xnoremap <C-h> g^
onoremap <C-h> g^

nnoremap <C-l> g$
xnoremap <C-l> g$
onoremap <C-l> g$

nnoremap <C-j> 8gj
nnoremap <C-k> 8gk

nnoremap + 10<C-w>>
nnoremap _ 10<C-w><

" copy to system clipboard
xnoremap <C-c> "+y

xnoremap <C-c> :!tee >(xsel -b)<CR>

""" Plugins
nnoremap <bar> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=26

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>

" scroll floating windows/popups with Up and Down
nnoremap <silent><nowait><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Up>"
nnoremap <silent><nowait><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Down>"
inoremap <silent><nowait><expr> <Up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <Down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Up>"
vnoremap <silent><nowait><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Down>"

let g:user_emmet_leader_key=','

inoremap <silent><expr> <tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xnoremap <leader>fr <Plug>(coc-format-selected)
nnoremap <leader>fr <Plug>(coc-format-selected)

xnoremap M <Plug>(coc-codeaction-selected)
nnoremap M <Plug>(coc-codeaction)

nnoremap <leader>. :CocCommand<CR>

""" Colorschemes

"colo monokai
"colo monokai_pro

"colo codedark

"colo material

colo nightfox

highlight CocFloating guibg=#1d1d1d


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
}
EOF
