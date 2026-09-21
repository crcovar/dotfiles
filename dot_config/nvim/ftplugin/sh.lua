local palette = require("palette")

-- vim.api.nvim_set_hl(0, "shVariable", { fg = palette.bright.cyan })

require("nvim-treesitter").install({ "bash" })
vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("bashls")
