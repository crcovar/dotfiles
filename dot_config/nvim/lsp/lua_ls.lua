return {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
          "hs",
          "spoon",
          "require",
          "MiniDeps",
          "MiniPick",
          "MiniDiff",
        }, -- Recognize 'vim' as a global variable
      },
      workspace = {
        library = {
          vim.fn.expand("~/.hammerspoon/Spoons/EmmyLua.spoon/annotations"),
        },
      },
    },
  },
}
