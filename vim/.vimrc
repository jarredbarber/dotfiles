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

lua <<END
vim.g.symbols_outline = {
    auto_close = true,
    show_numbers = true,
    show_relative_numbers = true,
    show_symbol_details = true,
    symbol_blacklist = { "Field", "Variable" }
}
END
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
Plug 'mzlogin/vim-markdown-toc'
Plug 'nvim-lua/popup.nvim'
Plug 'renerocksai/telekasten.nvim'

Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'ryanoasis/vim-devicons'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/completion-nvim'
Plug 'matbme/JABS.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'JuliaEditorSupport/julia-vim'

Plug 'preservim/vim-lexical'
Plug 'folke/zen-mode.nvim'
Plug 'junegunn/limelight.vim'

call plug#end()

" Run lua plugins

lua << END
require('lualine').setup{options={theme='horizon'}}
require('nvim-tree').setup() 
require('zen-mode').setup() 
require('telescope').setup()
require('which-key').setup()
require('jabs').setup{position='center', width=100}
local home = vim.fn.expand("~/write")
require('telekasten').setup {
    home = home,
    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,
    command_palette_theme = 'dropdown',

    -- dir names for special notes (absolute path or subdir name)
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image (sub)dir for pasting
    -- dir name (absolute path or subdir name)
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- prefix file with uuid
    prefix_title_by_uuid = false,
    -- file uuid type ("rand" or input for os.date()")
    uuid_type = "%Y%m%d%H%M",
    -- UUID separator
    uuid_sep = "-",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- default sort option: 'filename', 'modified'
    sort = "filename",

    -- integrate with calendar-vim
    plug_into_calendar = false,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "ivy",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "ivy",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "smart",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

    -- should all links be updated when a file is renamed
    rename_update_links = true,
}
-- require'nerveux'.setup {
--     neuron_dir = "~/.zet",
--     use_cache = true,
--     virtual_titles = true,
--     create_default_mappings = true,
--     kill_daemon_at_exit = true,
-- }

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
require'lspconfig'.sourcekit.setup{}
END

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

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
" Define some leader commands for switching buffer
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>s :SymbolsOutline<cr>
nmap <leader>d <Plug>(easymotion-bd-w)
nmap s <Plug>(easymotion-s)

command! W :w " I always hit shift on the 'w' in ':w'
command! Latex :call LaTeXtoUnicode#Toggle()<cr>

" Run the q macro
nnoremap Q @q 

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

nnoremap <leader>e :NvimTreeToggle<cr>
nnoremap <leader>t :NvimTreeFindFile<cr>

nnoremap <leader>b :JABSOpen<cr>

" Telekasten
nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>

" on hesitation, bring up the panel
nnoremap <leader>zp :lua require('telekasten').panel()<CR>

" Zen mode
nnoremap <leader>cz :ZenMode<CR>
nnoremap <leader>cl :Limelight<CR>

set termguicolors

source ~/.vim/local.vim

