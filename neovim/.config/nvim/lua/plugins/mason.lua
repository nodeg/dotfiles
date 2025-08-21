-- https://github.com/mason-org/mason.nvim
return {
    "mason-org/mason.nvim", version = "^2.0.0",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
}
