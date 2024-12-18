vim.g.mapleader = " "

--line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- vim.filetype.plugin.indent = true

--indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hidden = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- search highlighting
vim.opt.incsearch = true
vim.opt.hlsearch = true;
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlighting on esc" })

vim.opt.scrolloff=20
vim.opt.signcolumn="yes"
vim.opt.colorcolumn="100"
vim.opt.textwidth=100
vim.opt.syntax="on"

vim.opt.whichwrap="b,s,<,>,h,l,[,]"

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.o.timeout = true
vim.o.timeoutlen = 300

