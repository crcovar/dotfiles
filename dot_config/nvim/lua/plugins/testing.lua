return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      -- "nvim-treesitter/nvim-treesitter",
      -- adapters
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-jest",
      "jfpedroza/neotest-elixir",
    },
    keys = {
      { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", mode = { "n" }, desc = "Run Neotest" },
      {
        "<leader>tf",
        "<cmd>lua require('neotest').run.rule(vim.fn.expand('%'))<cr>",
        mode = { "n" },
        desc = "Run Neotest on File",
      },
      {
        "<leader>ts",
        "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>",
        mode = { "n" },
        desc = "Run Neotest on Project",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        mode = { "n" },
        desc = "Run Neotest with Jest Watch",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "pnpm test --",
          }),
          require("neotest-elixir"),
          require("neotest-go"),
        },
      })
    end,
  },
}
