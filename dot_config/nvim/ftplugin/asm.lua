require("nvim-treesitter").install({ "asm" }):wait(300000)
vim.treesitter.start()
vim.lsp.enable({ "asm_lsp" })
