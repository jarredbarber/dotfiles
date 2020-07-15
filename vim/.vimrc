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
" Tim Pope, plugin wizard
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Programming language stuff
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'JuliaEditorSupport/julia-vim'
Plug 'rust-lang/rust.vim'
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
colorscheme kuroi

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
    execute "au BufRead " . g:todo_md#file . " nnoremap <leader><leader> :call ToggleCheck()<cr>"
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

" Adapted from unimpaired.vim by Tim Pope.
function! s:DoAction(algorithm,type)
  " backup settings that we will change
  let sel_save = &selection
  let cb_save = &clipboard
  " make selection and clipboard work the way we need
  set selection=inclusive clipboard-=unnamed clipboard-=unnamedplus
  " backup the unnamed register, which we will be yanking into
  let reg_save = @@
  " yank the relevant text, and also set the visual selection (which will be reused if the text
  " needs to be replaced)
  if a:type =~ '^\d\+$'
    " if type is a number, then select that many lines
    silent exe 'normal! V'.a:type.'$y'
  elseif a:type =~ '^.$'
    " if type is 'v', 'V', or '<C-V>' (i.e. 0x16) then reselect the visual region
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    " line-based text motion
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    " block-based text motion
    silent exe "normal! `[\<C-V>`]y"
  else
    " char-based text motion
    silent exe "normal! `[v`]y"
  endif
  " call the user-defined function, passing it the contents of the unnamed register
  let repl = s:{a:algorithm}(@@)
  " if the function returned a value, then replace the text
  if type(repl) == 1
    " put the replacement text into the unnamed register, and also set it to be a
    " characterwise, linewise, or blockwise selection, based upon the selection type of the
    " yank we did above
    call setreg('@', repl, getregtype('@'))
    " relect the visual region and paste
    normal! gvp
  endif
  " restore saved settings and register value
  let @@ = reg_save
  let &selection = sel_save
  let &clipboard = cb_save
endfunction

function! s:ActionOpfunc(type)
  return s:DoAction(s:encode_algorithm, a:type)
endfunction

function! s:ActionSetup(algorithm)
  let s:encode_algorithm = a:algorithm
  let &opfunc = matchstr(expand('<sfile>'), '<SNR>\d\+_').'ActionOpfunc'
endfunction

function! MapAction(algorithm, key)
  exe 'nnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>ActionSetup("'.a:algorithm.'")<CR>g@'
  exe 'xnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",visualmode())<CR>'
  exe 'nnoremap <silent> <Plug>actionsLine'.a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",v:count1)<CR>'
  exe 'nmap '.a:key.'  <Plug>actions'.a:algorithm
  exe 'xmap '.a:key.'  <Plug>actions'.a:algorithm
  exe 'nmap '.a:key.a:key[strlen(a:key)-1].' <Plug>actionsLine'.a:algorithm
endfunction

function! Ishango(str)
lua << EOF
EOF
endfunction
