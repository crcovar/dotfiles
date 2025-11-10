require("nvim-treesitter").install({ "zig" }):wait(300000)

vim.treesitter.start()
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("zls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format({ name = "zls", async = false })
      end,
    })
  end,
})
