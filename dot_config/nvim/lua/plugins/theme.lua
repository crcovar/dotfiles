local highlight = {
  "RainbowDelimiterRed",
  "RainbowDelimiterYellow",
  "RainbowDelimiterBlue",
  "RainbowDelimiterOrange",
  "RainbowDelimiterGreen",
  "RainbowDelimiterViolet",
  "RainbowDelimiterCyan",
}

-- local function branchSubstr(str)
--   local s = str:match("%a+%-%d+")
--   if s ~= nil then
--     return s
--   else
--     return str:sub(1, 10)
--   end
-- end

return {
  -- icons
  {
    "nvim-mini/mini.icons",
    version = "*",
    config = function()
      local icons = require("mini.icons")
      icons.setup()
      -- icons.mock_nvim_web_devicons()
    end,
  },
  -- status line
  {
    "nvim-mini/mini.statusline",
    version = false,
    config = function()
      require("mini.statusline").setup()
    end,
  },
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
  -- FIX: - something needing to fix
  -- HACK: - This shit makes no sense, but is fixing something
  -- INFO: - Just some information or context
  -- NOTE: - Just a comment needing attention
  -- PERF: - Something to do with performance
  -- TEST: - Indicate a test
  -- TODO: - Action item for the future
  -- WARN: - Warning for the next developer to watch out for
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoQuickFix" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  -- highlight colors
  -- TODO: - Remove in v0.12, use LSP instead
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      enable_tailwind = true,
    },
  },
  -- Programmer's spellcheck
  {
    "psliwka/vim-dirtytalk",
    build = ":DirtytalkUpdate",
    config = function()
      vim.opt.spelllang = { "en_us", "programming" }
    end,
  },
}
