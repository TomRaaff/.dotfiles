vim.keymap.set("n", "<leader>1", "<Cmd>Neotree toggle<CR>", { desc = "[1] Open/focus the neotree file explorer" })

require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = { ".DS_Store" }
        },
        follow_current_file = { enabled = true },
    },
    window = {
        mappings = {
            ["h"] = "close_node",
            ["l"] = "open"
        }
    },
    buffers = {
        follow_current_file = {
            enabled = true
        }
    }
});

