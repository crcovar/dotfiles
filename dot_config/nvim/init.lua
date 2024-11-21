require("config.lazy")

-- Setup folding on treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Telescope Keybindings
local builtin = require "telescope.builtin"
vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set('n', "<leader>fr", builtin.oldfiles, { desc = "Telescope old files" })
vim.keymap.set('n', "<leader>fc", builtin.commands, { desc = "Telesceope commands" })

