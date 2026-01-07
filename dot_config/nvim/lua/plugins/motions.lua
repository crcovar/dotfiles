return {
  -- {
  --   "chrisgrieser/nvim-spider",
  --   opts = {
  --     skipInsignificantPunctuation = false,
  --   },
  --   keys = {
  --     { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "Spider-e" },
  --     { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Spider-b" },
  --     { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Spider-w" },
  --   },
  -- },
  -- surround
  {
    "nvim-mini/mini.surround",
    version = false,
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mini.surround").setup()
    end,
  },
}
