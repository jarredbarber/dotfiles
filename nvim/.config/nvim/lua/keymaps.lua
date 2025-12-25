local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation (from old vimrc)
keymap("n", "<leader>n", ":bnext<CR>", { desc = "Next Buffer" })
keymap("n", "<leader>p", ":bprevious<CR>", { desc = "Previous Buffer" })

-- Clear search highlights
keymap("n", "<leader>ch", ":nohlsearch<CR>", { desc = "Clear Highlights" })

-- Fast saving (from old vimrc: W for w)
vim.cmd("command! W w")

-- Run q macro
keymap("n", "Q", "@q", opts)

-- Stay in indent mode when indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
