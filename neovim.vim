set encoding=utf-8
set number
set signcolumn=number
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
filetype indent off
filetype plugin indent on
set hidden
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

call plug#begin()
  " IDE
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Utility
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdcommenter'
  Plug 'svermeulen/vim-easyclip' " mm and black hole dd
  Plug 'matze/vim-move' " move lines and characters around
  Plug 'tpope/vim-repeat'

  " Themes
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'tomasiser/vim-code-dark'
  Plug 'marko-cerovac/material.nvim'
  Plug 'EdenEast/nightfox.nvim'
call plug#end()

""" Git

nmap <leader>gic :vsplit<CR>:term git add . && git commit<CR>a
nmap <leader>gim :vsplit<CR>:term git commit --amend<CR>a
nmap <leader>gip :vsplit<CR>:term git push --set-upstream origin main<CR>a

""" Plugins
nmap <bar> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=26

nmap <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fl :Lines<CR>

" scroll floating windows/popups with Up and Down
nmap <silent><nowait><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Up>"
nmap <silent><nowait><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Down>"
imap <silent><nowait><expr> <Up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
imap <silent><nowait><expr> <Down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vmap <silent><nowait><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Up>"
vmap <silent><nowait><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Down>"

imap <silent><expr> <tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" GoTo code navigation.
nmap <silent> cgd <Plug>(coc-definition)
nmap <silent> cgy <Plug>(coc-type-definition)
nmap <silent> cgi <Plug>(coc-implementation)
nmap <silent> cgr <Plug>(coc-references)

nmap <silent> K :call <SID>show_documentation()<CR>
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

nmap <leader>cr <Plug>(coc-rename)

xmap <leader>cfr <Plug>(coc-format-selected)
nmap <leader>cfr <Plug>(coc-format)

nmap <leader>cfx <Plug>(coc-format-selected)

nmap M <Plug>(coc-codeaction)

xmap M <Plug>(coc-codeaction-selected)
nmap M <Plug>(coc-codeaction)

nmap <leader>. :CocCommand<CR>

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

" Filetype stuff
autocmd BufNewFile,BufRead *.html :set filetype=htmldjango
