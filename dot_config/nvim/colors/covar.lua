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

-- Highlight Groups
local theme = {
  background = { bg = palette.bright.black },
  ColorColumn = { bg = palette.black },
  Folded = { bg = palette.black, fg = palette.cyan },
  CursorLineNr = { fg = palette.yellow, bg = palette.bright.black, bold = true },
  LineNrAbove = { fg = palette.white, bg = palette.black, bold = true },
  LineNrBelow = { fg = palette.white, bg = palette.black, bold = true },
}
local spelling = {
  SpellBad = { sp = palette.bright.red, undercurl = true },
  SpellCap = { sp = palette.bright.yellow, undercurl = true },
  SpellRare = { sp = palette.bright.blue, undercurl = true },
  SpellLocal = { sp = palette.yellow, undercurl = true },
}
local syntax = {
  Comment = { fg = palette.bright.yellow, italic = true },
  Constant = { fg = palette.yellow, force = true },
  String = { fg = palette.green },
  Character = { fg = palette.bright.green, bold = true },
  Number = { fg = palette.yellow },
  Boolean = { fg = palette.yellow },
  Float = { fg = palette.yellow },
  Identifier = {},
  Function = {},
  Statement = {},
  Conditional = {},
  Repeat = {},
  Label = { fg = palette.bright.blue },
  Operator = { fg = palette.bright.white },
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
  Added = { fg = palette.green },
  Changed = { fg = palette.bright.blue },
  Removed = { fg = palette.red },
}
local treesitter = {
  ["@comment.documentation"] = { fg = palette.bright.yellow, italic = true, standout = true },
  ["@function"] = { fg = palette.bright.blue },
  ["@function.call"] = {},
  ["@function.method.call"] = {},
  ["@string.special"] = { fg = palette.yellow },
  ["@string.special.path"] = { fg = palette.blue, underline = true },
}
local lsp = {
  ["@lsp.type.function"] = {},
  ["@lsp.type.method"] = {},
  ["@lsp.typemod.class.declaration"] = { fg = palette.blue },
  ["@lsp.typemod.function.declaration"] = { fg = palette.bright.blue },
  ["@lsp.typemod.parameter.declaration"] = { fg = palette.bright.cyan },
  ["@lsp.typemod.variable.declaration"] = { fg = palette.bright.cyan },
}
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
local statusline = {
  MiniStatuslineModeNormal = { bg = palette.blue, bold = true },
  MiniStatuslineModeInsert = { bg = palette.green, bold = true },
  MiniStatuslineModeVisual = { bg = palette.yellow, bold = true },
  MiniStatuslineModeReplace = { bg = palette.magenta, bold = true },
  MiniStatuslineModeCommand = { bg = palette.cyan, bold = true },
  MiniStatuslineModeOther = { bg = palette.red, bold = true },
  MiniStatuslineDevinfo = { bg = palette.bright.black, fg = palette.blue },
  MiniStatuslineFileInfo = { bg = palette.bright.black, fg = palette.yellow },
}

local hightlight_groups = vim.tbl_extend("error", theme, spelling, syntax, treesitter, lsp, diagnostics, statusline)

-- Set the highlights
for k, v in pairs(hightlight_groups) do
  vim.api.nvim_set_hl(0, k, v)
end

return palette
