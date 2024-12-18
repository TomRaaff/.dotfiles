-- highlights the line on the current cursor position
require('nvim-cursorline').setup {
    cursorline = {
        enable = true,
        timeout = 100,
        number = true,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    }
}
