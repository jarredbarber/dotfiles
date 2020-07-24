filetype plugin on
filetype indent on

set number
" set relativenumber
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
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'doums/darcula'

" Tim Pope, plugin wizard
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Stuff I'm checking out
Plug 'svermeulen/vim-cutlass'
" Plug 'svermeulen/vim-yoink'
Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'

" Programming language stuff
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'lighttiger2505/deoplete-vim-lsp'

Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
" Plug 'JuliaEditorSupport/julia-vim'
" Plug 'rust-lang/rust.vim'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'jpalardy/vim-slime'

" Utilities
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
call plug#end()
let g:deoplete#enable_at_startup=1

let mapleader=" "
let maplocalleader=","

set background=dark   "or use the light theme: set background=light
" colorscheme kuroi
colorscheme gruvbox

nnoremap <leader>rc :e ~/.vimrc<cr>
nnoremap <leader>src :source ~/.vimrc<cr>
" Define some leader commands for switching buffers
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>1 :buf 1<cr>
nnoremap <leader>2 :buf 2<cr>
nnoremap <leader>3 :buf 3<cr>
nnoremap <leader>4 :buf 4<cr>
nnoremap <leader>5 :buf 5<cr>
nnoremap <leader>6 :buf 6<cr>
nnoremap <leader>7 :buf 7<cr>
nnoremap <leader>8 :buf 8<cr>
nnoremap <leader>9 :buf 9<cr>
nnoremap <leader>10 :buf 10<cr>

nnoremap <leader>md :set filetype=markdown<cr>

command! W :w " I always hit shift on the 'w' in ':w'
command! L2U :call LaTeXtoUnicode#Toggle()
nnoremap <leader>latex :call LaTeXtoUnicode#Toggle()<cr>

" Run the q macro
nnoremap Q @q 

" Configure stuff related to Zettel
augroup filetypedetect
    au! BufNewFile,BufRead /home/jarred/notebook/zettel/*.md setf privwiki.markdown
    au! BufNewFile,BufRead /home/jarred/notebook/zettel/*.md set suffixesadd=.md
augroup END
map <silent> <leader>zet :FZF ~/notebook/zettel<cr>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>\<cr>" : "\<TAB>"

" TODO tracker
augroup todo_md
    au!
    let g:todo_md#file = "~/org/todo.md"
    let g:todo_md#script = "~/Library/Application\\ Support/Übersicht/widgets/minimalist-todo.widget/todo.coffee"
    execute "au BufWrite " . g:todo_md#file . " silent !touch " . g:todo_md#script . ""
    execute "nnoremap <leader>todo :e " . g:todo_md#file . "<cr>"
    execute "au BufRead " . g:todo_md#file . " nnoremap <localleader><localleader> :call ToggleCheck()<cr>"
augroup END

function! ToggleCheck()
    let l:line = getline(line('.')) 
    if match(l:line, '^\s*-') + 1
        execute "normal! ^xix" 
    endif
    if match(l:line, '^\s*x') + 1
        execute "normal! ^xi-" 
    endif
endfunction

function! InlineCommand(cmd)
    " let l:cmd = input('Command: ')
    let l:output = system(a:cmd)
    let l:output = substitute(l:output, '[\r\n]*$', '', '')
    execute 'normal a ' . l:output
endfunction


