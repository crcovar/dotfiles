local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "mattn/emmet-vim" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  { "github/copilot.vim" },
  { "lewis6991/gitsigns.nvim" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "sbdchd/neoformat" },
  { "neovim/nvim-lspconfig" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "williamboman/mason.nvim" },
  { "chrisgrieser/nvim-spider", lazy = true },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { "HiPhish/rainbow-delimiters.nvim" },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}

require("lazy").setup(plugins, opts)

-- LSP Setup
require("mason").setup()

require'lspconfig'.ts_ls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.pyright.setup{}

-- Colorscheme
--vim.cmd [[colorscheme tokyonight-night]]

-- Neoformat
local fmt = vim.api.nvim_create_augroup("fmt", { clear = true });
vim.api.nvim_create_autocmd("BufWritePre", { command = "undojoin | Neoformat", group = fmt});
-- vim.api.nvim_create_autocmd("InsertLeave", { command = "undojoin | Neoformat", group = fmt});

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
