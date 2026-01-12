vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 5

vim.o.cursorline = true
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.colorcolumn = { 50, 72, 80 }
vim.opt.termguicolors = true

vim.o.clipboard = "unnamedplus"
vim.o.wrap = false

-- Setup folding
vim.o.foldmethod = "expr"
-- Keep folds from collapsing while we work
local folds_group = vim.api.nvim_create_augroup("folds", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  group = folds_group,
  pattern = "*",
  callback = function()
    vim.w.oldfdm = vim.wo.foldmethod
    vim.wo.foldmethod = "manual"
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = folds_group,
  pattern = "*",
  callback = function()
    if vim.w.oldfdm then
      vim.wo.foldmethod = vim.w.oldfdm
      vim.w.oldfdm = nil
    end
    vim.cmd("normal! zv")
  end,
}) -- Local project configuration

vim.o.exrc = true

-- Undercurls
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.o.spell = true

-- Highlight selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
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

    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- LSP folding if available
    if client ~= nil and client:supports_method("textDocument/foldingRange") and vim.wo.foldexpr == 0 then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})
-- LSP Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ silent = true })
  end,
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

vim.o.confirm = true

vim.cmd.colorscheme("covar")

-- Caddyfile
vim.filetype.add({
  extension = {
    caddy = "caddy",
  },
  filename = {
    Caddyfile = "caddy",
    ["Caddyfile.dev"] = "caddy",
  },
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  checker = { enabled = false },
})

-- PLAYGROUND. Everything Below this line is just for messing around

-- AppleScript filetype
vim.filetype.add({
  extension = {
    applescript = "applescript",
  },
})

function fd(cmdarg, cmdcomplete)
  local args = { "fd", "--type", "f", "--color=never" }
  if cmdarg then
    table.insert(args, cmdarg)
  end
  return vim.fn.systemlist(args)
end
