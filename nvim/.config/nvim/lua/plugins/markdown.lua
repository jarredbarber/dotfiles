return {
  -- Markdown rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
    ft = { "markdown" },
  },

  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
      window = {
        width = 120,
      },
    },
  },

  -- Telekasten (Zettelkasten)
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>zf", "<cmd>Telekasten find_notes<cr>", desc = "Find Notes" },
      { "<leader>zd", "<cmd>Telekasten find_daily_notes<cr>", desc = "Daily Note" },
      { "<leader>zg", "<cmd>Telekasten search_notes<cr>", desc = "Search Notes" },
      { "<leader>zn", "<cmd>Telekasten new_note<cr>", desc = "New Note" },
    },
    opts = {
      home = vim.fn.expand("~/writing"), -- Default location
      -- The user can customize this later
    },
  },

  -- Bullets.vim for better list handling
  {
    "dkarter/bullets.vim",
    ft = { "markdown", "text" },
  }
}
