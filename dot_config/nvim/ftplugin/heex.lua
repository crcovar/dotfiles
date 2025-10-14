require("nvim-treesitter").install({ "heex" }):wait(300000)

vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.lsp.enable({ "cssls", "expert", "html", "tailwindcss" })
