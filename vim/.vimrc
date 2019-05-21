
filetype plugin on
filetype indent on


set number
set relativenumber

set autoread

set wildmenu

set ruler

set backspace=eol,start,indent

set ignorecase

set smartcase

set hlsearch

set incsearch

set lazyredraw

set magic

set foldcolumn=1

syntax enable

set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

set ai
set si
set wrap

call plug#begin('~/.vim/plugged')
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
" Plug 'arcticicestudio/nord-vim'
" Plug 'junegunn/seoul256.vim'
call plug#end()


" let g:seoul256_background = 233
" colo seoul256

" For 
set t_Co=256
set termguicolors
set background=dark   "or use the light theme: set background=light
colorscheme kuroi
