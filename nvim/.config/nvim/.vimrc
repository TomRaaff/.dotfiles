set number			            " Show current line number
set relativenumber		        " Show relative line numbers
filetype plugin indent on       " show existing tab with 4 spaces width
set tabstop=4                   " when indenting with '>', use 4 spaces width
set shiftwidth=4                " On pressing tab, insert 4 spaces
set expandtab                   " In Insert mode, expand tabs to spaces
set hidden                      " Keep your buffers in memory when switching files
set noerrorbells                " disable bells when you make a mistake
set incsearch
set scrolloff=8                 " scroll offset for the cursor
set signcolumn=yes              " add column for error messages
set colorcolumn=120             " set a colored bar to indicate where 100 chars are
set textwidth=120               " let vim add linebreaks at 120 chars
set syntax=on
set whichwrap=b,s,<,>,h,l,[,]   " allows the cursor to move from the end of a line to the next one by pressing right

call plug#begin('~/.vim/plugged')   " Specify a directory for plugins 
Plug 'gruvbox-community/gruvbox'    " syntax highlighting plugin
" undotree plugin for later?
call plug#end()                     " Initialize plugin system

colorscheme gruvbox

" \+...  Surrounds a selection with...
:map \' c'<Esc>pa'<Esc>
:map \" c"<Esc>pa"<Esc>
:map \( c(<Esc>pa)<Esc>
:map \{ c{ <Esc>pa }<Esc>
:map \[ c[ <Esc>pa ]<Esc>

" \o or \O adds a new line without leaving normal mode
:map \O O<Esc>j
:map \o o<Esc>k

" \y to yank to clipboard
:map \y "*y
