local eslint = require("efmls-configs.linters.eslint")
local jq = require("efmls-configs.linters.jq")
local prettier = require("efmls-configs.formatters.prettier_d")
local stylua = require("efmls-configs.formatters.stylua")

local languages = {
  lua = { stylua },
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  json = { jq, prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  html = { prettier },
  css = { prettier },
}

return {
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { ".git/" },
    languages = languages,
  },
}
