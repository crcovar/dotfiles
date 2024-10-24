return {
  { "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      return {
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
        }),
        sources = cmp.config.sources(
          { { name = "nvim_lsp" }, },
          { { name = "buffer" } },
          { {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            }
          }
        ),
      }
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
}
