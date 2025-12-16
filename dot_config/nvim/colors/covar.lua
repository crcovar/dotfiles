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

vim.api.nvim_set_hl(0, "LineNr", { fg = palette.yellow, bg = palette.bright.black, bold = true })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = palette.green, bg = palette.black, bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = palette.green, bg = palette.black, bold = true })
