-- https://github.com/mason-org/mason-lspconfig.nvim
return {
    "mason-org/mason-lspconfig.nvim", version = "^2.0.0",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}