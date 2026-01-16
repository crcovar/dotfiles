local palette = require("config.palette")
vim.api.nvim_set_hl(0, "@keyword.return.go", { fg = palette.magenta, bold = true })

require("nvim-treesitter").install({ "go" }):wait(300000)
vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.lsp.enable("gopls")
