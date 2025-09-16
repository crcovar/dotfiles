require("nvim-treesitter").install({ "regex" }):wait(300000)

vim.treesitter.start()
