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
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  { "github/copilot.vim" },
  { "lewis6991/gitsigns.nvim" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "sbdchd/neoformat" },
  { "neovim/nvim-lspconfig", lazy = false, dependencies = { "hrsh7th/cmp-nvim-lsp" } },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        ensure_installed = {
          "astro",
          "awk",
          "bash",
          "c",
          "cpp",
          "css",
          "csv",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "go",
          "html",
          "javascript",
          "json",
          "jq",
          "regex",
          "sql",
          "tsv",
          "tsx",
          "typescript",
        },
        highlight = { enable = true },
        ignore_install = {},
        indent = { enable = true },
        modules = {},
        sync_install = false,
      })
    end
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "hrsh7th/cmp-nvim-lsp" } },
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}},
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
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } }
      }
    }
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { -- optional completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  { "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}

local opts = {}

require("lazy").setup(plugins, opts)

require('gitsigns').setup()

local lsp_servers = {
    "astro",
    "awk_ls",
    "bashls",
    "cssls",
    "elixirls",
    "gopls",
    "html",
    "htmx",
    "pylsp",
    "lua_ls",
    "ts_ls",
},
-- LSP Setup
require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = true,
  ensure_installed = lsp_servers
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in pairs(lsp_servers) do
  require("lspconfig")[lsp].setup { capabilities = capabilities }
end

-- Remap lsp rename to <leader>rn
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {})

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
