call plug#begin()
" Plugins
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ryanoasis/vim-devicons'
Plug 'posva/vim-vue'
call plug#end()


" Default Settings
colorscheme dracula

set number
set encoding=UTF-8
set guifont=FiraCode_Nerd_Font:h11
set backspace=2
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

if exists('+termguicolors')
  set termguicolors
endif


" Airline
let g:airline_powerline_fonts = 1


" NERDTree
"" Remap NERDTree to toggle with ctrl + b, like VSCode
nnoremap <C-b> :NERDTreeToggle<CR>

"" Closes NERDTree when open a file
let NERDTreeQuitOnOpen = 1


" Coc.Settings
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver']

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
