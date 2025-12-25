return {
  -- HectorDB
  {
    dir="/Users/jarred/PROJECTS/hector/hectordb",
    name="hectordb",
    config = function()
        require('hector').setup({})
    end,
    --dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      -- { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    lazy = false,
    opts = {
      -- -- Idempotent: it will show icons if devicons is installed
      -- columns = {
      --   "icon",
      -- },
      -- -- Skip confirmation for simple deletes
      -- skip_confirm_for_simple_edits = true,
      -- -- Better window behavior
      -- view_options = {
      --   -- Show files and directories that start with dot
      --   show_hidden = true,
      -- },
    },
  },
}
