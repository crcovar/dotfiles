-- We don't have lua_ls here because its covered by lazydev
local lsp_servers = {
  "astro",
  "awk_ls",
  "bashls",
  "emmet_language_server",
  "jsonls",
  "gopls",
  "html",
  "htmx",
  "lua_ls",
  "pylsp",
  "tailwindcss",
  "ts_ls",
  "zls",
}

return {
  { "williamboman/mason.nvim", opts = {}, },
  {
    "williamboman/mason-lspconfig.nvim", opts = {
      automatic_installation = true,
      ensure_installed = { "cssls", "sqls", unpack(lsp_servers) }
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "hrsh7th/cmp-nvim-lsp", opts = {} },
    keys = {
      { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", mode = "n" },
      { "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", mode = "n" },
    },
    config = function ()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for _, lsp in pairs(lsp_servers) do
        require("lspconfig")[lsp].setup { capabilities = capabilities }
      end
      -- sqls gets special treatment
      require("lspconfig").sqls.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          require('sqls').on_attach(client, bufnr)
        end
      }
      -- cssls setup to ignore tailwindcss unknown at rules
      require("lspconfig").cssls.setup {
        capabilities = capabilities,
        settings = {
          css = {
            lint = {
              unknownAtRules = "ignore",
            }
          }
        }
      }
    end,
    --[[init = function ()
      -- Remap lsp rename to <leader>rn
      vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {})
    end
    ]]--
  },
  --[[
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function ()
      vim.diagnostic.config({ virtual_text = true })
    end,
    opts = {},
  },
  ]]--
}
