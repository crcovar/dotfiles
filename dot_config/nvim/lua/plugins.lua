MiniDeps.add({ source = "nvim-mini/mini.icons", checkout = "stable" })
MiniDeps.add({ source = "nvim-mini/mini.statusline", checkout = "stable" })
MiniDeps.add({ source = "nvim-mini/mini.pick", checkout = "stable" })
MiniDeps.add({ source = "nvim-mini/mini-git", checkout = "stable" })
MiniDeps.add({ source = "nvim-mini/mini.diff", checkout = "stable" })
MiniDeps.add({ source = "nvim-mini/mini.surround", checkout = "stable" })

MiniDeps.add("HiPhish/rainbow-delimiters.nvim")
MiniDeps.add("nvim-lua/plenary.nvim")
MiniDeps.add("folke/todo-comments.nvim")
MiniDeps.add("brenoprata10/nvim-highlight-colors")
MiniDeps.add({
  source = "psliwka/vim-dirtytalk",
  hooks = {
    post_checkout = function()
      vim.cmd("DirtytalkUpdate")
    end,
  },
})

MiniDeps.add({
  source = "nvim-treesitter/nvim-treesitter",
  checkout = "main",
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})

MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.add("creativenull/efmls-configs-nvim")
MiniDeps.add("williamboman/mason.nvim")

MiniDeps.add("obsidian-nvim/obsidian.nvim")

-- Plugin setup

vim.opt.spelllang = { "en_us", "programming" }

require("mini.icons").setup()
require("mini.statusline").setup()
-- Extra attention for certain comments
-- FIX: - something needing to fix
-- HACK: - This shit makes no sense, but is fixing something
-- INFO: - Just some information or context
-- NOTE: - Just a comment needing attention
-- PERF: - Something to do with performance
-- TEST: - Indicate a test
-- TODO: - Action item for the future
-- WARN: - Warning for the next developer to watch out for
require("todo-comments").setup()

require("nvim-highlight-colors").setup({ enable_tailwind = true })

-- picker
require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", MiniPick.builtin.grep_live, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", MiniPick.builtin.help, { noremap = true, silent = true })

require("mason").setup()

require("mini.git").setup()
require("mini.diff").setup()
vim.keymap.set("n", "<leader>df", MiniDiff.toggle_overlay, { noremap = true, silent = true })

require("mini.surround").setup()

MiniDeps.later(function()
  require("obsidian").setup({
    legacy_commands = false, -- TODO: - Remove in next major release
    note = { template = nil },
    note_id_func = function(title)
      return "0 Inbox/" .. title
    end,
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/My notes",
      },
    },
  })
end)

vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fo", "<cmd>Obsidian quick_switch<CR>", { noremap = true, silent = true })
