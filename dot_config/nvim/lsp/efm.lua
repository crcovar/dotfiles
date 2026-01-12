local eslint = require("efmls-configs.linters.eslint")
local golint = require("efmls-configs.linters.golint")
local gofmt = require("efmls-configs.formatters.gofmt")
local jq = require("efmls-configs.linters.jq")
local prettier = require("efmls-configs.formatters.prettier_d")
local stylua = require("efmls-configs.formatters.stylua")

local fs = require("efmls-configs.fs")

local languages = {
  lua = { stylua },
  go = { golint, gofmt },
  elixir = {
    {
      formatCommand = string.format("%s %s", fs.executable("mix"), "format --stdin-filename ${INPUT} -"),
      formatStdin = true,
      rootMarkers = {
        ".formatter.exs",
        "mix.exs",
      },
    },
  },
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  json = { jq, prettier },
  markdown = { prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  html = { prettier },
  css = { prettier },
  yaml = { prettier },
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
