return {
  "nvim-neotest/neotest",
  filetype = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  keys = {
    { "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>", desc = "Run Neotest" },
    { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "Toggle Neotest Summary" },
    { "<leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<CR>", desc = "Debug Neotest" },
  },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      ["neotest-vitest"] = {
        -- is_test_file = function(file_path)
        --   return file_path:match("test?%.ts$") or file_path:match("test?%.js$")
        -- end,
      },
    },
  },
}
