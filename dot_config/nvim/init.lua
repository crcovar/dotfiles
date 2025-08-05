require("config.lazy")

-- Setup folding on treesitter
vim.o.foldmethod = "expr"

-- Local project configuration
vim.o.exrc = true

-- Undercurls
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.o.spell = true
vim.opt.spelllang = { "en_us" }

local lsp_servers = {
  "astro",
  "awk_ls",
  "bashls",
  "cssls",
  "efm",
  "emmet_language_server",
  "jsonls",
  "gopls",
  "html",
  "lua_ls",
  "pylsp",
  "sqls",
  "tailwindcss",
  "ts_ls",
  "zls",
}
vim.lsp.enable(lsp_servers)

-- enable lsp completion
vim.opt.completeopt = { "fuzzy", "menuone", "noinsert", "popup" }
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub("%b()", "") }
      end,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        local efm = vim.lsp.get_clients({ name = "efm", bufnr = ev.buf })
        if vim.tbl_isempty(efm) then
          return
        end

        vim.lsp.buf.format({ name = "efm", async = false })
      end,
    })

    -- LSP folding if available
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/foldingRange") and vim.wo.foldexpr == 0 then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    vim.api.nvim_set_keymap(
      "n",
      "<leader>e",
      "<cmd>lua vim.diagnostic.open_float()<cr>",
      { noremap = true, silent = true }
    )
  end,
})

vim.o.confirm = true

--vim.o.statusline = "%{mode([1])} %f %(%m%h%r%)%=%=%(%P %l:%c%)"
function fd(cmdarg, cmdcomplete)
  local args = { "fd", "--type", "f", "--color=never" }
  if cmdarg then
    table.insert(args, cmdarg)
  end
  return vim.fn.systemlist(args)
end
