return {
  {
    "nvim-mini/mini.pick",
    version = false,
    config = function()
      local pick = require("mini.pick").setup()
      vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Pick files<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Pick buffers<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Pick grep_live<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Pick help<CR>", { noremap = true, silent = true })
    end,
  },
}
