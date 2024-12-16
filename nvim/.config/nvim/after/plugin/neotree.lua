vim.keymap.set("n", "<leader>1", "<Cmd>Neotree toggle<CR>", { desc = "Open/focus the neotree file explorer" })

require("neo-tree").setup({
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
    -- event_handlers = {
    --      {
    --          event = "file_opened",
    --          handler = function()
    --              require("neo-tree.command").execute({ action = "close"})
    --          end
    --      },
    -- },
    buffers = {
        follow_current_file = {
            enabled = true
        }
    }
});
