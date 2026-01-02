require("nvim-treesitter").install({ "css", "html", "javascript" }):wait(300000)

vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable({ "cssls", "emmet_language_server", "html", "tailwindcss" })
