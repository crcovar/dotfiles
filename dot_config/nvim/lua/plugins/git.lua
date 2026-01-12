return {
  {
    "nvim-mini/mini-git",
    version = false,
    config = function()
      require("mini.git").setup()
    end,
  },
  {
    "nvim-mini/mini.diff",
    version = false,
    config = function()
      local diff = require("mini.diff")
      diff.setup()
      vim.keymap.set("n", "<leader>df", diff.toggle_overlay, { noremap = true, silent = true })
    end,
  },
}
