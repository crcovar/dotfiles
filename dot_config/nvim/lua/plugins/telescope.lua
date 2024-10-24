
local builtin = require "telescope.builtin"

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>ff", builtin.find_files, mode = "n" },
      { "<leader>fg", builtin.live_grep, mode = "n" },
      { "<leader>fb", builtin.buffers, mode = "n" },
      { "<leader>fh", builtin.help_tags, mode = "n" },
    },
    opts = {},
  },
}
