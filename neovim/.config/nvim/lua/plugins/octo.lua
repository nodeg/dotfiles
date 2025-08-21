-- https://github.com/pwntester/octo.nvim
return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local octo = require("octo")

    octo.setup({
        picker = "snacks",
        suppress_missing_scope = {
          projects_v2 = true,
        }
      })
  end,
}
