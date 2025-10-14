require("nvim-treesitter").install({ "sql" }):wait(300000)
vim.treesitter.start()

vim.lsp.enable("sqls")
