require("ed-cmd").setup({
    -- Those are the default options, you can just call setup({}) if you don't want to change the defaults
    cmdline = {
        keymaps = { edit = "<ESC>", execute = "<CR>", close = "<C-C>" },
        win_config = function()
            return {
                relative = "editor",
                width = math.ceil(vim.o.columns / 3),
                row = math.floor(vim.o.lines * 0.2),
                col = math.floor(vim.o.columns / 3),
                height = 2,
                style = "minimal",
                border = "single",
                zindex = 240 --popupmenu is 250
            }
        end,
    },
    pumenu = {
        win_opts = function()
            local pum_info = vim.fn.pum_getpos()
            local complete_info = vim.fn.complete_info()
            local footer = pum_info.size and tostring(pum_info.size) or ""
            local title = complete_info.mode
            return {
                border = "single",
                title = title,
                title_pos = "center",
                footer = footer,
                footer_pos = "center",
            }
        end
    },
    -- You enter normal mode in the cmdline with edit, execute a
    -- command from normal mode with execute and close the cmdline in
    -- normal mode with close
    -- The keymaps fields also accept list of keymaps
    -- cmdline = { keymaps = { close = { "<C-C>" , "q" } } },
})

