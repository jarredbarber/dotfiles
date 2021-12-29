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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/completion-nvim'
Plug 'matbme/JABS.nvim'
" Plug 'ms-jpq/coq_nvim' " in python :(

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
require("jabs").setup{position='center', width=100}

local map = function(key, value)
	vim.api.nvim_buf_set_keymap(0,'n',key,value,{noremap = true, silent = true});
end

local custom_attach = function(client)
	print("LSP started.");
	require'completion'.on_attach(client)
	-- require'diagnostic'.on_attach(client)

	-- map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	--map('<localleader>d','<cmd>lua vim.lsp.buf.definition()<CR>')
	--map('<localleader>h','<cmd>lua vim.lsp.buf.hover()<CR>')
	--map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	-- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	-- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	-- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	-- map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	-- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	-- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	-- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	-- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	-- map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
	-- map('<localleader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

require'lspconfig'.pyright.setup{on_attach=custom_attach}
require'lspconfig'.rust_analyzer.setup{}
END

let mapleader=" "
let maplocalleader=","

set background=dark   "or use the light theme: set background=light
colorscheme lighthaus

" Some completion stuff
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

nnoremap <leader>ce :e ~/.vimrc<cr>
nnoremap <leader>cs :source ~/.vimrc<cr>
" nnoremap <leader>src :source ~/.vimrc<cr>
" Define some leader commands for switching buffers
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>

command! W :w " I always hit shift on the 'w' in ':w'
command! Latex :call LaTeXtoUnicode#Toggle()<cr>

" Run the q macro
nnoremap Q @q 

" nmap <localleader>h :call CocAction('doHover')<cr>
" nmap <localleader>d <Plug>(coc-definition)
" nmap <localleader>r <Plug>(coc-rename)
" nmap <localleader>f <Plug>(coc-format-selected)
" nmap <localleader>R <Plug>(coc-references-used)
" nmap <localleader>ref <Plug>(coc-refactor)
nmap <localleader>h <cmd>lua vim.lsp.buf.hover()<cr>
nmap <localleader>d <cmd>lua vim.lsp.buf.definition()<cr>
nmap <localleader>f <cmd>lua vim.lsp.buf.formatting()<cr>
nmap <localleader>ai <cmd>lua vim.lsp.buf.incoming_calls()<cr>
nmap <localleader>ao <cmd>lua vim.lsp.buf.outgoing_calls()<cr>
nmap <localleader>ar <cmd>lua vim.lsp.buf.rename()<cr>
nmap <localleader>r <cmd>lua vim.lsp.buf.references()<cr>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" NERD Tree
" let NERDTreeQuitOnOpen=1
nnoremap <leader>e :NvimTreeToggle<cr>
nnoremap <leader>t :NvimTreeFindFile<cr>

nnoremap <leader>b :JABSOpen<cr>

set termguicolors


