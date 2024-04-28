-- https://github.com/NeogitOrg/neogit
return {
    "NeogitOrg/neogit",
    branch = "nightly",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
}
  