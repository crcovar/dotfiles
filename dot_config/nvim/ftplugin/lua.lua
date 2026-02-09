MiniDeps.add("folke/lazydev.nvim")
require("lazydev").setup({
  library = {
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

local palette = require("palette")
require("nvim-treesitter").install({ "lua" }):wait(300000)

vim.api.nvim_set_hl(0, "@property.lua", { fg = palette.bright.cyan })

vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("lua_ls")
