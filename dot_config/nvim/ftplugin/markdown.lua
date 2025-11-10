require("nvim-treesitter").install({ "markdown" })
vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.w.conceallevel = 2
vim.wo.wrap = true
vim.wo.linebreak = true
