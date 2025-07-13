return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", mode = { "n" }, desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", mode = { "n" }, desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", mode = { "n" }, desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", mode = { "n" }, desc = "Help Tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", mode = { "n" }, desc = "Recent Files" },
      { "<leader>fc", "<cmd>Telescope commands<CR>", mode = { "n" }, desc = "Commands" },
    },
  },
}
