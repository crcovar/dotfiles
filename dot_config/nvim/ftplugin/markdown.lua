local palette = require("config.palette")
require("nvim-treesitter").install({ "markdown" })

vim.api.nvim_set_hl(0, "@markup.raw", { fg = palette.white, italic = true, bold = true })

vim.treesitter.start()

vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.wo.conceallevel = 2
vim.wo.wrap = true
vim.wo.linebreak = true
