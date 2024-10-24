" Adapted from https://gist.github.com/simonista/8703722
set nocompatible
set encoding=utf-8
syntax on
filetype plugin indent on

" Color scheme (terminal)
set t_Co=256
set background=dark

" Security
set nomodeline

" Misc
set number
set belloff=all
set laststatus=2
set showmode
set showcmd

" Whitespace
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Rendering
set ttyfast

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Commands for competitive programming
let mapleader=' '
set timeoutlen=2000
nmap <leader>yy :%y+
nmap <leader>pp :%d _<CR>"+P:w<CR>

" Above are from fhvirus, below are mines

inoremap jk <Esc>
inoremap jj <Esc>A
inoremap JJ <Esc>A
inoremap <C-s> <Esc>:w<CR>a
