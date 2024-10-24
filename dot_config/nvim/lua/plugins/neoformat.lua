return {
  { "sbdchd/neoformat",
    opts = {},
    config = function()
      local fmt = vim.api.nvim_create_augroup("fmt", { clear = true });
      vim.api.nvim_create_autocmd("BufWritePre", { command = "undojoin | Neoformat", group = fmt});
      -- vim.api.nvim_create_autocmd("InsertLeave", { command = "undojoin | Neoformat", group = fmt});
    end
  },
}
