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
Plug 'JuliaEditorSupport/julia-vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'jpalardy/vim-slime'
call plug#end()

set background=dark   "or use the light theme: set background=light
colorscheme kuroi

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
" 	autocmd!
" 	autocmd VimEnter * :Vexplore
" augroup END

command! W :w " I always hit shift on the 'w' in ':w'
command! L2U :call LaTeXtoUnicode#Toggle()
" Run the q macro
nnoremap Q @q 

" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END

" Configure vim-slime
let g:slime_target = "tmux"
nmap <silent> <c-c><c-j> [[V][ <Plug>SlimeRegionSend

" Configure markdown-preview.nvim
let g:mkdp_port=8640 
