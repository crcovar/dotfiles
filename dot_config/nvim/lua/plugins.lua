vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons",      version = "stable" },
  { src = "https://github.com/nvim-mini/mini.statusline", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.pick",       version = "stable" },
  { src = "https://github.com/nvim-mini/mini-git",        version = "stable" },
  { src = "https://github.com/nvim-mini/mini.diff",       version = "stable" },
  { src = "https://github.com/nvim-mini/mini.surround",   version = "stable" },
  "https://github.com/HiPhish/rainbow-delimiters.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/brenoprata10/nvim-highlight-colors",
  "https://github.com/psliwka/vim-dirtytalk",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/obsidian-nvim/obsidian.nvim",
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd("TSUpdate")
    end
    if name == 'vim-dirtytalk' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('vim-dirtytalk') end
      vim.cmd('DirtyTalkUpdate')
    end
  end
})

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

vim.schedule(function()
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
