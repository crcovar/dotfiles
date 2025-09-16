return {
  { "tpope/vim-fugitive", lazy = false },
  { "lewis6991/gitsigns.nvim", lazy = true, opts = {} },
  {
    "akinsho/git-conflict.nvim",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    lazy = true,
    config = true,
    opts = {},
  },
}
