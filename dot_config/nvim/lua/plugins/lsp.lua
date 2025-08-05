return {
  {
    "williamboman/mason.nvim",
    opts = {},
    cmd = "Mason",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
      },
    },
  },
}
