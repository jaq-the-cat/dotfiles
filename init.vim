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
Plug 'marko-cerovac/material.nvim'
Plug 'tanvirtin/monokai.nvim'
call plug#end()

" Autostart NERDTree
"autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeWinSize=26

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

" Cool stuff
nnoremap <bar> :NERDTreeToggle<CR>

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xnoremap <leader>fr  <Plug>(coc-format-selected)
nnoremap <leader>fr  <Plug>(coc-format-selected)

xnoremap <leader>w  <Plug>(coc-codeaction-selected)
nnoremap <leader>w  <Plug>(coc-codeaction-selected)

nnoremap <leader>. :CocCommand<CR>

" scroll floating windows/popups with C-f and C-b
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Plugins
let g:user_emmet_leader_key=','

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

colo monokai
"colo monokai_pro

let g:material_style = 'palenight'
"colo material

highlight CocFloating guibg=#1D1E19


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
}
EOF
