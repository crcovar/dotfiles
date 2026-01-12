return {
  {
    "nvim-mini/mini.pick",
    version = false,
    config = function()
      require("mini.pick").setup()
      vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fg", MiniPick.builtin.grep_live, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fh", MiniPick.builtin.help, { noremap = true, silent = true })
    end,
  },
}
