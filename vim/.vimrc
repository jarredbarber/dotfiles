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

" milliseconds
set timeoutlen=50

set mouse=a

call plug#begin('~/.vim/plugged')
" Colorschemes
Plug 'cocopon/iceberg.vim'
Plug 'mrjones2014/lighthaus.nvim'
Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'tlhr/anderson.vim'

" Tim Pope, plugin wizard
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Stuff I'm checking out
Plug 'easymotion/vim-easymotion'

Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'

Plug 'ryanoasis/vim-devicons'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'JuliaEditorSupport/julia-vim'

" Utilities
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
call plug#end()

" Run lua plugins
lua << END
require('lualine').setup{options={theme='horizon'}}
require'nvim-tree'.setup() 
require('telescope').setup()
require("which-key").setup()
END

let mapleader=" "
let maplocalleader=","

set background=dark   "or use the light theme: set background=light
colorscheme lighthaus

nnoremap <leader>rc :e ~/.vimrc<cr>
nnoremap <leader>src :source ~/.vimrc<cr>
" Define some leader commands for switching buffers
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>

command! W :w " I always hit shift on the 'w' in ':w'
command! Latex :call LaTeXtoUnicode#Toggle()<cr>

" Run the q macro
nnoremap Q @q 

nmap <localleader>h :call CocAction('doHover')<cr>
nmap <localleader>d <Plug>(coc-definition)
nmap <localleader>r <Plug>(coc-rename)
nmap <localleader>f <Plug>(coc-format-selected)
nmap <localleader>R <Plug>(coc-references-used)
nmap <localleader>ref <Plug>(coc-refactor)

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" NERD Tree
" let NERDTreeQuitOnOpen=1
nnoremap <leader>e :NvimTreeToggle<cr>
nnoremap <leader>t :NvimTreeFindFile<cr>

set termguicolors


" au FileType python call SetWorkspaceFolders()

" function! SetWorkspaceFolders() abort
"     " Only set g:WorkspaceFolders if it is not already set
"     if exists("g:WorkspaceFolders") | return | endif

"     if executable("findup")
"         let l:ws_dir = system("cd '" . expand("%:h") . "' && findup packageInfo")
"         " Bemol conveniently generates a '$WS_DIR/.bemol/ws_root_folders' file, so let's leverage it
"         let l:folders_file = l:ws_dir . "/.bemol/ws_root_folders"
"         if filereadable(l:folders_file)
"             let l:ws_folders = readfile(l:folders_file)
"             let g:WorkspaceFolders = filter(l:ws_folders, "isdirectory(v:val)")
"         endif
"     endif
" endfunction
