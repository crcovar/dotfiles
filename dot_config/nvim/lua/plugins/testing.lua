return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- adapters
      "nvim-neotest/neotest-jest",
    },
    config = function ()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "pnpm test --",
          })
        }
      })
    end
  },
}
