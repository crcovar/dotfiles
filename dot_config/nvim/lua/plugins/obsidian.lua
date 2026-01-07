-- Plugin keymaps
vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>oq", "<cmd>Obsidian quick_switch<CR>", { noremap = true, silent = true })

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- cmd = "Obsidian",
  -- keys = {
  --   { "<leader>on", "<cmd>Obsidian new<CR>", mode = { "n" }, desc = "Obsidian New Note" },
  --   { "<leader>oq", "<cmd>Obsidian quick_switch<CR>", mode = { "n" }, desc = "Obsidian Quick Switch" },
  -- },
  --- @module 'obsidan',
  --- @type obsidian.config
  opts = {
    legacy_commands = false, -- TODO: - Remove in next major release
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/My notes",
      },
    },
  },
}
