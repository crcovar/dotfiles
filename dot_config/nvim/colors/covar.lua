local palette = {
  black = "#000000",
  red = "#ec273f",
  green = "#5ab552",
  yellow = "#f3a833",
  blue = "#3388de",
  magenta = "#c878af",
  cyan = "#008b8b",
  white = "#b0a7b8",

  bright = {
    black = "#10121c",
    red = "#fa6e79",
    green = "#9de64e",
    yellow = "#e8d282",
    blue = "#36c5f4",
    magenta = "#deceed",
    cyan = "#6dead6",
    white = "#ffffff",
  },
}

vim.api.nvim_set_hl(0, "background", { bg = palette.bright.black })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = palette.black })

vim.api.nvim_set_hl(0, "Folded", { bg = palette.black, fg = palette.cyan, standout = true })

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.yellow, bg = palette.bright.black, bold = true })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = palette.green, bg = palette.black, bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = palette.green, bg = palette.black, bold = true })

-- spelling Highlights
vim.api.nvim_set_hl(0, "SpellBad", { sp = palette.bright.red, undercurl = true })
vim.api.nvim_set_hl(0, "SpellCap", { sp = palette.bright.yellow, undercurl = true })
vim.api.nvim_set_hl(0, "SpellRare", { sp = palette.bright.blue, undercurl = true })
vim.api.nvim_set_hl(0, "SpellLocal", { sp = palette.yellow, undercurl = true })

local syntax = {
  Comment = { fg = palette.bright.yellow, italic = true },
  Constant = { fg = palette.yellow },
  String = { fg = palette.green },
  Character = { fg = palette.yellow },
  Number = { fg = palette.yellow },
  Boolean = { fg = palette.yellow },
  Float = { fg = palette.yellow },
  Identifier = {},
  Function = {},
  Statement = {},
  Conditional = {},
  Repeat = {},
  Label = {},
  Operator = {},
  Keyword = { italic = true },
  Exception = {},
  PreProc = {},
  Include = {},
  Define = {},
  Macro = {},
  PreCondit = {},
  Type = {},
  StorageClass = {},
  Structure = {},
  Typedef = {},
  Special = {},
  SpecialChar = {},
  Tag = {},
  Delimiter = {},
  SpecialComment = {},
  Debug = {},
  Underlined = { fg = palette.blue, underline = true },
  Ignore = {},
  Error = {},
  Todo = {},
  Added = { fg = palette.green, standout = true },
  Changed = {},
  Removed = { fg = palette.red, standout = true },
}

for k, v in pairs(syntax) do
  vim.api.nvim_set_hl(0, k, v)
end

-- Treesitter highlights
local treesitter = {
  ["@function"] = { fg = palette.bright.blue },
  ["@function.call"] = {},
  ["@function.method.call"] = {},
  ["@string.special"] = { fg = palette.yellow },
  ["@string.special.path"] = { fg = palette.blue, underline = true },
}
for k, v in pairs(treesitter) do
  vim.api.nvim_set_hl(0, k, v)
end

local diagnostics = {
  DiagnosticError = { fg = palette.red },
  DiagnosticWarn = { fg = palette.yellow },
  DiagnosticInfo = { fg = palette.cyan },
  DiagnosticHint = { fg = palette.blue },
  DiagnosticOk = { fg = palette.green },
  DiagnosticUnnecessary = { fg = palette.blue, standout = true },
  DiagnosticUnderlineError = { sp = palette.red, underdotted = true },
  DiagnosticUnderlineWarn = { sp = palette.yellow, underdotted = true },
  DiagnosticUnderlineInfo = { sp = palette.cyan, underdotted = true },
  DiagnosticUnderlineHint = { sp = palette.blue, underdotted = true },
  DiagnosticUnderlineOk = { sp = palette.green, underdotted = true },
}
for k, v in pairs(diagnostics) do
  vim.api.nvim_set_hl(0, k, v)
end
