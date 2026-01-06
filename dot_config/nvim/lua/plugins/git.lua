return {
  {
    "nvim-mini/mini-git",
    version = false,
    cmd = "Git",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mini.git").setup()
    end,
  },
  {
    "nvim-mini/mini.diff",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local diff = require("mini.diff")
      diff.setup()
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    lazy = true,
    config = true,
    opts = {},
  },
}
