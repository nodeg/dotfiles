vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment number
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement number
