require("nvim-treesitter").install({ "rust" }):wait(300000)

vim.bo.shiftwidth = 4
vim.bo.autocomplete = false

vim.keymap.set("i", "<C-Space>", "<C-X><C-O>")

vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.lsp.enable("rust_analyzer")
-- vim.lsp.inlay_hint.enable(true)
