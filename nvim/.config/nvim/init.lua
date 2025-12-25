-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load options before plugins
require("options")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Plugins will be added here
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
  },
  -- Disable some UI features in VSCode
  ui = {
    disabled = vim.g.vscode ~= nil,
  },
})

-- Load keymaps
require("keymaps")
