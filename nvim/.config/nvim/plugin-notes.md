# NeoVim-config

<C> = control
<S> = Shift
<A> = Alt (unusable for mac)
<M> = Meta (maybe Option??)

## remaps
- copy to system clipboard: <leader>y
- move lines up and down when in Visual mode: J and K
- paste without overwriting the paste buffer: <leader>p
- replace current word: <leader>s
- some quickfix navigation mappings. (See remaps.lua)
- jump between projects: <leader>x
- navigate between splits: ctrl+h , ctrl+j, ctrl+k and ctrl+l

## Plugins

### Search: Telescope
see `after/plugin/telescope.lua`

### File Explorer: Neotree
Open file tree: <leader>e (think: explorer)

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

### Git: fugitive
Basically, Fugitive is a wrapper around git commands that simply lets you interact with git through a vim way.

see `after/plugin/git.lua` for the keymappings
or <leader>g with which-key

Stage parts of files: <leader>ga (think: [G]it [A]dd --patch)
https://stackoverflow.com/a/1085191

    y - stage this hunk for the next commit
    n - do not stage this hunk for the next commit
    q - quit; do not stage this hunk or any of the remaining hunks
    a - stage this hunk and all later hunks in the file
    d - do not stage this hunk or any of the later hunks in the file
    g - select a hunk to go to
    / - search for a hunk matching the given regex
    j - leave this hunk undecided, see next undecided hunk
    J - leave this hunk undecided, see next hunk
    k - leave this hunk undecided, see previous undecided hunk
    K - leave this hunk undecided, see previous hunk
    s - split the current hunk into smaller hunks
    e - manually edit the current hunk
      -   You can then edit the hunk manually by replacing +/- by # (thanks veksen)
    ? - print hunk help


### Undo
Access undotree: <leader>u

### Smart-splits
Enables easy modification of split windows.
Move between them with <C> h,j,k,l
Resize them with <S> h,j,k,l
Swap them with <leader><leader> h,j,k,l

### Code completion: cmp
ctrl + y = to accept an autocomplete suggestion
ctrl + n = select next option
ctrl + p = select previous option

### neoScroll
used for smooth scrolling when using ctrl+u and ctrl+d

### feline
a prettier statusbar.
It is probably possible to configure it prettier, but I can/should dive into that more deeply.



