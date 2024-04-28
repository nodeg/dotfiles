-- https://github.com/numToStr/Comment.nvim
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin
    local comment = require("Comment")

    comment.setup({
    -- configuration
    })
  end,
}
