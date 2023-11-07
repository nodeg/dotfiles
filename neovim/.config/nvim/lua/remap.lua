vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap

-- general
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment number
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement number
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- trouble
keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)
keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end)
keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end)
keymap.set("n", "gR", function()
	require("trouble").toggle("lsp_references")
end)
