require('telescope').setup{
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            height = 0.75,
            width = 0.9,
            prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

-- When in the fuzzy finder:
-- ctrl + y = up
-- ctrl + n = down
-- ctrl + v = open file in vertical split

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sw', builtin.live_grep, { desc = '[S]earch [W]ord' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sgc', builtin.git_commits, { desc = '[S]earch [G]it [C]ommits' })
vim.keymap.set('n', '<leader>sgb', builtin.git_branches, { desc = '[S]earch [G]it [B]ranches' })

vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sc', builtin.current_buffer_fuzzy_find, { desc = '[S]earch in [C]urrent file' })
vim.keymap.set('n', '<leader>se', builtin.oldfiles, { desc = '[S]earch r[E]cent Files' })
vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = '[S]earch [Q]uickfix list' })
vim.keymap.set('n', '<leader>so', builtin.vim_options, { desc = '[S]earch vim [O]options' })
vim.keymap.set('n', '<leader>sm', builtin.man_pages, { desc = '[S]earch [M]anual pages' })
vim.keymap.set('n', '<leader>sy', builtin.lsp_document_symbols, { desc = '[S]earch s[Y]mbols' })
-- lsp pickers
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sb', builtin.lsp_references, { desc = '[S]earch references [B]' })

