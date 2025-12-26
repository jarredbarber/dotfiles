-- Basic Options
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true

opt.autoindent = true
opt.smartindent = true
opt.wrap = true

opt.termguicolors = true
opt.timeoutlen = 300 -- Increased slightly for WhichKey, old was 50
opt.updatetime = 250
opt.signcolumn = "yes"

-- System clipboard
-- opt.clipboard = "unnamedplus"

-- Decrease update time
opt.updatetime = 250

-- Backspace
opt.backspace = "indent,eol,start"

-- Split behavior
opt.splitright = true
opt.splitbelow = true
