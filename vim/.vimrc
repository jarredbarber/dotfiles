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
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'jpalardy/vim-slime'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
call plug#end()
let g:deoplete#enable_at_startup=1


let mapleader=" "
let maplocalleader=","

set background=dark   "or use the light theme: set background=light
colorscheme kuroi

nnoremap <leader>rc :e ~/.vimrc<cr>
nnoremap <leader>src :source ~/.vimrc<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

command! W :w " I always hit shift on the 'w' in ':w'
command! L2U :call LaTeXtoUnicode#Toggle()
nnoremap <leader>latex :call LaTeXtoUnicode#Toggle()<cr>

" Run the q macro
nnoremap Q @q 

" Configure vim-slime
let g:slime_target = "tmux"
nmap <silent> <c-c><c-j> [[V][ <Plug>SlimeRegionSend

" Configure stuff related to Zettel
augroup filetypedetect
    au! BufNewFile,BufRead /home/jarred/notebook/zettel/*.md setf privwiki.markdown
    au! BufNewFile,BufRead /home/jarred/notebook/zettel/*.md set suffixesadd=.md
augroup END
map <silent> <leader>zet :FZF ~/notebook/zettel<cr>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
