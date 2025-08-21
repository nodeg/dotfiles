-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    { "<leader>ee", ":Neotree toggle<CR>", desc = "Toggle file explorer", silent = true },
  },
  config = function()
    local tree = require("neo-tree")
    tree.setup({
        close_if_last_window = true,
        window = {
            mappings = {
                ["<space>"] = "none",
            },
        },
    })
  end,
}