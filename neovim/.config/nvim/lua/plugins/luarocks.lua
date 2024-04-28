-- https://github.com/vhyrro/luarocks.nvim
-- needed for https://github.com/nvim-neorg/neorg
return {
  "vhyrro/luarocks.nvim",
  priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,
}
