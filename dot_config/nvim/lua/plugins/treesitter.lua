return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        ensure_installed = {
          "astro",
          "awk",
          "bash",
          "c",
          "cpp",
          "css",
          "csv",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "go",
          "html",
          "javascript",
          "json",
          "jq",
          "regex",
          "sql",
          "tsv",
          "tsx",
          "typescript",
        },
        highlight = { enable = true },
        additional_vim_regex_highlighting = false,
        ignore_install = {},
        indent = { enable = true },
        modules = {},
        sync_install = false,
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
  },
  { "nvim-treesitter/nvim-treesitter-textobjects", },
}
