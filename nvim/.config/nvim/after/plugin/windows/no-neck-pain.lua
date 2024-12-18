local NoNeckPain = require("no-neck-pain")

NoNeckPain.setup({
    width = 130,
    minSideBufferWidth = 10,
    autocmds = {
        enableOnVimEnter = false,
        skipEnteringNoNeckPainBuffer = true,
    },
    mappings = {
        enabled = true,
        toggle = "<Leader>np",
        toggleLeftSide = "<Leader>nql",
        toggleRightSide = "<Leader>nqr",
        widthUp = "<Leader>n=",
        widthDown = "<Leader>n-",
        scratchPad = "<Leader>ns",
    },
    integrations = {
        -- @link https://github.com/nvfalseim-neo-tree/neo-tree.nvim
        NeoTree = {
            position = "right",
            -- When `true`, if the tree was opened before enabling the plugin, we will reopen it.
            reopen = false,
        },
        undotree = {
            position = "left",
        },
        neotest = {
            position = "right",
            reopen = true,
        },
        NvfalseimDAPUI = {
            position = "none",
            reopen = true,
        },
    },
    bufferOptions = {
        enabled = false,
    }
});
