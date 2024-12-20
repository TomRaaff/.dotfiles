# NeoVim-config

`<C>` = control
`<S>` = Shift
`<A>` = Alt (unusable for mac)
`<M>` = Meta (maybe Option??)

## remaps

- copy to system clipboard: `<leader>y`
- move lines up and down when in Visual mode: J and K
- paste without overwriting the paste buffer: `<leader>p`
- replace current word: `<leader>s`
- some quickfix navigation mappings. (See remaps.lua)
- jump between projects: `<leader>x`
- navigate between splits: ctrl+h , ctrl+j, ctrl+k and ctrl+l

## Plugins

### Search: Telescope

- open file in v-split: `<C-v>`

see `after/plugin/telescope.lua`

### File Explorer: Neotree

Open file tree: `<leader>e` (think: explorer)

When in the file tree:

- open help: ?
- open: enter
- open in vsplit: s
- create file: a
- create directory: A
- delete file: d
- rename file: r
- close all nodes: z
- filter files: /
- inspect file properties: i
- open file in v-split: s
- cycle through neotree views: < > (file-explorer, open buffers and git status)

### Code completion: cmp

ctrl + y = to accept an autocomplete suggestion
ctrl + n = select next option
ctrl + p = select previous option

### neoScroll

used for smooth scrolling when using ctrl+u and ctrl+d
