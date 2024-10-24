return {
  { "github/copilot.vim",
    lazy = false,
    keys = {
      { '<c-j>', 'copilot#Accept("\\<CR>")', mode = 'i', expr = true, replace_keycodes = false },
    },
    init = function ()
      vim.g.copilot_no_tab_map = true
    end,
  },
}
