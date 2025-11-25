require("nvim-treesitter").install({ "caddy" }):wait(300000)

vim.treesitter.start()
