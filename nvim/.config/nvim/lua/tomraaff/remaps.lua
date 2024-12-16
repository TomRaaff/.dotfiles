-- move lines up and down when in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-- Surrounds a selection with...
vim.keymap.set("v", "\\'", "c''<Esc>hp<Esc>", { desc = "Surround selection with ''" })
vim.keymap.set("v", "\\(", "c()<Esc>hp<Esc>", { desc = "Surround selection with ()" })
vim.keymap.set("v", "\\{", "c{  }<Esc>hhp<Esc>", { desc = "Surround selection with {}" })
vim.keymap.set("v", "\\[", "c[  ]<Esc>hhp<Esc>", { desc = "Surround selection with []" })

-- Cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "keep cursor in place while combining lines" })
vim.keymap.set("n", "n", "nzzzv", { desc = "keep cursor in the middle while searching" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep cursor in the middle while searching" })

-- Copy/Paste
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "doesn't overwrite the current paste buffer while pasting" })
vim.keymap.set("v", "<leader>y", "\"*y", { desc = "yank into system clipboard" })

vim.keymap.set("n", "Q", "<nop>", { desc = "don't quit vim using Q" })

-- Quickfix list
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>zz", { desc = "[Q]uickfix [O]pen" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>zz", { desc = "[Q]uickfix [C]lose" })
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- jump between projects
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- split windows
-- vim.keymap.set("n", "<C-H>", "<C-W>h", { desc = "Move to the left window split" })
-- vim.keymap.set("n", "<C-J>", "<C-W>j", { desc = "Move to the lower window split" })
-- vim.keymap.set("n", "<C-K>", "<C-W>k", { desc = "Move to the upper window split" })
-- vim.keymap.set("n", "<C-L>", "<C-W>l", { desc = "Move to the right window split" }) 
