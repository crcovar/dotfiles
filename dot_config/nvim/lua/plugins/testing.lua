return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- adapters
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-jest",
      "jfpedroza/neotest-elixir",
    },
    config = function ()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "pnpm test --",
          }),
          require("neotest-elixir"),
          require("neotest-go"),
        }
      })
    end
  },
}
