return {
  {
    "williamboman/mason.nvim",
    opts = {},
    dependencies = {
      {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
}
