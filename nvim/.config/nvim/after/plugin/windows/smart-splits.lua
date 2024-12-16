-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
-- todo: shift + J clashes with join lines. Replace shift in these remaps
--
-- vim.keymap.set('n', '<S-h>', require('smart-splits').resize_left, { desc = 'Resize split on the left' })
-- vim.keymap.set('n', '<S-j>', require('smart-splits').resize_down, { desc = 'Resize split downwards' })
-- vim.keymap.set('n', '<S-k>', require('smart-splits').resize_up, { desc = 'Resize split upwards' })
-- vim.keymap.set('n', '<S-l>', require('smart-splits').resize_right, { desc = 'Resize split on the right' })

-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = 'Move to split on the left' })
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = 'Move to split below' })
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = 'Move to split above' })
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = 'Move to split on the right' })
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous, { desc = 'Move to the previous split' })
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left, { desc = 'Swap split to the left' })
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down, { desc = 'Swap split downwards' })
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up, { desc = 'Swap split upwards' })
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right, { desc = 'Swap split to the right' })
