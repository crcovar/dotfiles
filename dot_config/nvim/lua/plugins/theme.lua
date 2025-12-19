local highlight = {
  "RainbowDelimiterRed",
  "RainbowDelimiterYellow",
  "RainbowDelimiterBlue",
  "RainbowDelimiterOrange",
  "RainbowDelimiterGreen",
  "RainbowDelimiterViolet",
  "RainbowDelimiterCyan",
}

local function branchSubstr(str)
  local s = str:match("%a+%-%d+")
  if s ~= nil then
    return s
  else
    return str:sub(1, 10)
  end
end

return {
  {
    "nvim-mini/mini.icons",
    version = "*",
    config = function()
      require("mini.icons").setup()
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
  -- Bottom status bar
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = {
  --     options = {
  --       icons_enabled = true,
  --       theme = "auto",
  --       component_separators = { left = "", right = "" },
  --       section_separators = { left = "", right = "" },
  --       disabled_filetypes = {
  --         statusline = {},
  --         winbar = {},
  --       },
  --       ignore_focus = {},
  --       always_divide_middle = true,
  --       always_show_tabline = true,
  --       globalstatus = false,
  --       refresh = {
  --         statusline = 1000,
  --         tabline = 1000,
  --         winbar = 1000,
  --         refresh_time = 16,
  --         events = {
  --           "WinEnter",
  --           "BufEnter",
  --           "BufWritePost",
  --           "SessionLoadPost",
  --           "FileChangedShellPost",
  --           "VimResized",
  --           "Filetype",
  --           "CursorMoved",
  --           "CursorMovedI",
  --           "ModeChanged",
  --         },
  --       },
  --     },
  --     sections = {
  --       lualine_a = { { "mode", separator = { left = "" } } },
  --       lualine_b = {
  --         {
  --           "branch",
  --           fmt = branchSubstr,
  --         },
  --         "diff",
  --         "diagnostics",
  --       },
  --       lualine_c = { "filename" },
  --       lualine_x = { "encoding", "fileformat", "filetype" },
  --       lualine_y = { "progress" },
  --       lualine_z = { { "location", separator = { right = "" } } },
  --     },
  --     inactive_sections = {
  --       lualine_a = {},
  --       lualine_b = {},
  --       lualine_c = { "filename" },
  --       lualine_x = { "location" },
  --       lualine_y = {},
  --       lualine_z = {},
  --     },
  --     tabline = {},
  --     winbar = {},
  --     inactive_winbar = {},
  --     extensions = {},
  --   },
  -- },
  -- indent markings
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      indent = {
        highlight = highlight,
      },
      scope = {
        highlight = highlight,
      },
    },
  },
  -- Extra attention for certain comments
  {
    "folke/todo-comments.nvim",
    -- FIX: - something needing to fix
    -- HACK: - This shit makes no sense, but is fixing something
    -- INFO: - Just some information or context
    -- NOTE: - Just a comment needing attention
    -- PERF: - Something to do with performance
    -- TEST: - Indicate a test
    -- TODO: - Action item for the future
    -- WARN: - Warning for the next developer to watch out for
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        pattern = ".*<(KEYWORDS)s*",
      },
    },
  },
  -- TODO: Remove in v0.12 and replace with lsp
  -- Color highlights
  { "brenoprata10/nvim-highlight-colors", opts = {
    enable_tailwind = true,
  } },
  -- Rainbow Trails
  { "sedm0784/vim-rainbow-trails", lazy = true },
  -- Programmer's spellcheck
  {
    "psliwka/vim-dirtytalk",
    build = ":DirtytalkUpdate",
    config = function()
      vim.opt.spelllang = { "en_us", "programming" }
    end,
  },
}
