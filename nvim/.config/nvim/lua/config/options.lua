-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = true
vim.opt.relativenumber = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- move to next line when arrived at the end of a line
vim.opt.whichwrap = "b,s,<,>,h,l,[,]"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 20

-- make sure indentation is 4 spaces by default
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
