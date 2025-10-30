require("config.lazy")

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 5

vim.o.cursorline = true
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.colorcolumn = { 50, 72, 80 }

vim.o.clipboard = "unnamedplus"
vim.o.wrap = false

-- Setup folding on treesitter
vim.o.foldmethod = "expr"

-- Local project configuration
vim.o.exrc = true

-- Undercurls
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Highlights
vim.api.nvim_set_hl(0, "SpellBad", { sp = "red", undercurl = true })
vim.api.nvim_set_hl(0, "SpellCap", { sp = "yellow", undercurl = true })
vim.api.nvim_set_hl(0, "SpellRare", { sp = "blue", undercurl = true })
vim.api.nvim_set_hl(0, "SpellLocal", { sp = "orange", undercurl = true })

vim.o.spell = true

-- Highlight selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 400 })
  end,
})

-- enable our generic language server, use for format on save
vim.lsp.enable("efm")

-- enable lsp completion, and formatting on save. Enabling of language servers
-- is handled in each ft plugin file.
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
        local clients = vim.lsp.get_clients({ bufnr = ev.buf })
        if
          vim.tbl_contains(clients, function(t)
            return t.name == "efm"
          end, { predicate = true })
        then
          vim.lsp.buf.format({ name = "efm", async = false })
        elseif
          vim.tbl_contains(clients, function(t)
            return t.name == "zls"
          end, { predicate = true })
        then
          vim.lsp.buf.format({ name = "zls", async = false })
        else
          return
        end
      end,
    })

    -- LSP folding if available
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client ~= nil and client:supports_method("textDocument/foldingRange") and vim.wo.foldexpr == 0 then
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

-- PLAYGROUND. Everything Below this line is just for messing around

-- AppleScript filetype
vim.filetype.add({
  extension = {
    applescript = "applescript",
  },
})

--vim.o.statusline = "%{mode([1])} %f %(%m%h%r%)%=%=%(%P %l:%c%)"
function fd(cmdarg, cmdcomplete)
  local args = { "fd", "--type", "f", "--color=never" }
  if cmdarg then
    table.insert(args, cmdarg)
  end
  return vim.fn.systemlist(args)
end
