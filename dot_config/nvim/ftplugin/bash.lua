require("nvim-treesitter").install({ "bash" })
vim.treesitter.start()
vim.lsp.enable("bashls")
