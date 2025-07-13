return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   cmd = "TSContext",
  --   opts = {},
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   event = { "BufReadPost", "BufNewFile" },
  -- },
}
