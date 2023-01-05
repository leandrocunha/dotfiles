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
Plug 'neoclide/coc-vetur'
Plug 'APZelos/blamer.nvim'
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
call plug#end()


" Default Settings
colorscheme dracula

"" Enable line numbers
set number

"" Enable encoding to show font icons
set encoding=UTF-8

"" Set the font family
set guifont=FiraCode_Nerd_Font:h11

"" When press tab, add 4 spaces
set expandtab

"" Insert tabs on stat of a line according to the shiftwidth
set smarttab

"" When ident with '>', use 2 spaces width
set shiftwidth=2

"" Show existing tabs with 2 spaces
set softtabstop=2
set tabstop=2

"" Change default character of indentLine plugin
set list lcs=tab:\|\

"" Show a line at columnWidth value to keep you aware of line size
set colorcolumn=100

"" Add a column to the left side, usefull for linters
set signcolumn=yes


if exists('+termguicolors')
  set termguicolors
endif


" Airline
"" Enable Powerline fonts
let g:airline_powerline_fonts = 1

"" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

"" Show just filename
let g:airline#extensions#tabline#fnamemod = ':t'



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


" Blamer
"" Enable Blamer on vim startup
let g:blamer_enabled = 1


" IdentLine
"" Set the characters to represent vertical identation line
let g:indentLine_char_list = ['┆', '┆', '┆', '┆']

" Key remaps
"" Move lines up/down like in VSCode
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
