-- We don't have lua_ls here because its covered by lazydev
local lsp_servers = {
  "astro",
  "awk_ls",
  "bashls",
  "cssls",
  "emmet_language_server",
  "jsonls",
  "gopls",
  "html",
  "lua_ls",
  "pylsp",
  "sqls",
  "tailwindcss",
  "ts_ls",
  "zls",
}

return {
  { "williamboman/mason.nvim", opts = {}, },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = lsp_servers,
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   lazy = false,
  --   keys = {
  --     { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",        mode = "n" },
  --     { "<leader>e",  "<cmd>lua vim.diagnostic.open_float()<CR>", mode = "n" },
  --     { "<leader>a",  "<cmd>lua vim.lsp.buf.code_action()<CR>",   mode = "n" },
  --   },
  -- },
}
