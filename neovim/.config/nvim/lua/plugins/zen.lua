-- https://github.com/folke/zen-mode.nvim
return {
  "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  opts = {
    plugins = {
      gitsigns = true,
      wezterm = {
        enabled = true,
        font = "+4"
      },
    },
  },
  keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}