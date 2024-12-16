require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight', -- does this work?
    },
    sections = {
        lualine_a = { 'filename' },
    },
}
