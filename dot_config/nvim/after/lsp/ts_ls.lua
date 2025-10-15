return {
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { "tsconfig.json", "jsconfig.json" })
      or vim.fs.root(bufnr, { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", ".git" })
      or vim.fn.getcwd()
    on_dir(root)
  end,
}
