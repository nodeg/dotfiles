require("opts")
require("remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins are located in their own module
require("lazy").setup("plugins", {
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    notify = false,
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    notify = true,
  },
})

-- require 'colorizer'.setup()
-- require("bufferline").setup{}
-- require('gitsigns').setup{}
