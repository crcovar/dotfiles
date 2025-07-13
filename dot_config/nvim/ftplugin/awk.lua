require("nvim-treesitter").install({ "awk" }):wait(300000)

vim.treesitter.start()
