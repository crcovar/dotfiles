-- We don't have lua_ls here because its covered by lazydev
local lsp_servers = {
  "astro",
  "awk_ls",
  "bashls",
  "cssls",
  "efm",
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
    -- opts = {
    --   ensure_installed = lsp_servers,
    -- },
  },
  {
    "creativenull/efmls-configs-nvim",
    dependencies = { "neovim/nvim-lspconfig", },
  },
}
