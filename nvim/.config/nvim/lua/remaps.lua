-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- move lines up and down when in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-- Surrounds a selection with...
-- NOTE learn surround.nvim
-- vim.keymap.set("v", "\\'", "c''<Esc>hp<Esc>", { desc = "Surround selection with ''" })
-- vim.keymap.set("v", "\\(", "c()<Esc>hp<Esc>", { desc = "Surround selection with ()" })
-- vim.keymap.set("v", "\\{", "c{  }<Esc>hhp<Esc>", { desc = "Surround selection with {}" })
-- vim.keymap.set("v", "\\[", "c[  ]<Esc>hhp<Esc>", { desc = "Surround selection with []" })

-- Cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "keep cursor in place while combining lines" })
vim.keymap.set("n", "n", "nzzzv", { desc = "keep cursor in the middle while searching" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep cursor in the middle while searching" })

-- Copy/Paste
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "doesn't overwrite the current paste buffer while pasting" })
vim.keymap.set("v", "<leader>y", '"*y', { desc = "yank into system clipboard" })

vim.keymap.set("n", "Q", "<nop>", { desc = "don't quit vim using Q" })

-- Quickfix list
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>zz", { desc = "[Q]uickfix [O]pen" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>zz", { desc = "[Q]uickfix [C]lose" })
