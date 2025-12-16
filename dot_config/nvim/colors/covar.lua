local palette = {
  black = "#000000",
  red = "#ac2847",
  green = "#26854c",
  yellow = "#e98537",
  blue = "#3859b3",
  magenta = "#9a4d76",
  cyan = "#36c5f4",
  white = "#b0a7b8",

  bright = {
    black = "#10121c",
    red = "#ec273f",
    green = "#5ab552",
    yellow = "#f3a833",
    blue = "#3388de",
    magenta = "#c878af",
    cyan = "#6dead6",
    white = "#ffffff",
  },
}

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = palette.green, bg = palette.black, bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = palette.green, bg = palette.black, bold = true })
