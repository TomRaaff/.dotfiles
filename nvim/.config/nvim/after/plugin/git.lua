-- fugitive
-- NOTE for most commands it might be more benificial to learn the zsh aliases
vim.keymap.set("n", "<leader>gf", function() vim.cmd [[Git fetch]] end, { desc = '[G]it [F]etch' })
vim.keymap.set("n", "<leader>gca", function() vim.cmd [[Git commit]] end, { desc = '[G]it [C]ommit [A]mend' })
vim.keymap.set("n", "<leader>gca", function() vim.cmd [[Git commit]] end, { desc = '[G]it [C]ommit [A]mend' })
vim.keymap.set("n", "<leader>gc", function() vim.cmd [[Git commit]] end, { desc = '[G]it [C]ommit' })
vim.keymap.set("n", "<leader>gl", function() vim.cmd [[Git pull]] end, { desc = '[G]it pul[L]' })
vim.keymap.set("n", "<leader>gp", function() vim.cmd [[Git push]] end, { desc = '[G]it [P]ush' })
vim.keymap.set("n", "<leader>gh", function() vim.cmd [[Git log --oneline --decorate]] end, { desc = '[G]it [H]istory' })
vim.keymap.set("n", "<leader>gpf", function() vim.cmd [[Git push --force-with-lease]] end, { desc = '[G]it [P]ush [F]orce-with-lease' })
vim.keymap.set("n", "<leader>ga", function() vim.cmd [[Git add --patch]] end, { desc = '[G]it [A]dd --patch' })

-- diffview
require('diffview').setup()
vim.keymap.set("n", "<leader>gs", vim.cmd.DiffviewOpen, { desc = "Open [G]it [S]tatus" })
vim.keymap.set("n", "<leader>gq", vim.cmd.DiffviewClose, { desc = "Close [G]it status [Q]" })

