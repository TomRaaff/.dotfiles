-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "keep cursor in place while combining lines" })
vim.keymap.set("n", "n", "nzzzv", { desc = "keep cursor in the middle while searching" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep cursor in the middle while searching" })

-- Diagnostics
vim.keymap.set("n", "<leader>dm", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
