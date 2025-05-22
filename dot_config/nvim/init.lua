require("config.lazy")

-- Setup folding on treesitter
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Telescope Keybindings
local builtin = require "telescope.builtin"
vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set('n', "<leader>fr", builtin.oldfiles, { desc = "Telescope old files" })
vim.keymap.set('n', "<leader>fc", builtin.commands, { desc = "Telesceope commands" })

-- Neotest Keybindings
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.rule(vim.fn.expand('%'))<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
  {})

-- Local project configuration
vim.o.exrc = true

-- Undercurls
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.o.spell = true
vim.opt.spelllang = { "en_us", }

-- enable lsp completion
vim.opt.completeopt = { "fuzzy", "menuone", "noinsert", "popup", }
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
      autotrigger = true,
      convert = function(item) return { abbr = item.label:gsub("%b()", "") } end,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function() vim.lsp.buf.format({ async = false }) end
    });

    vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>",
      { noremap = true, silent = true })
  end,
})

-- cssls setup to ignore tailwindcss unknown at rules
vim.lsp.config('cssls', {
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      }
    }
  }
})

vim.o.confirm = true
