# TMUX

## Installation
install tmux through `brew install tmux`

run `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` to install the tmux package
manager (tpm). 
Installing through brew puts tpm at an unexpected location and the config won't run correctly. 

## Usage
prefix = ctrl + b

### Sessions
New session: tmux new -s {session-name}
Attach to session: tmux a -t {session-name}
Detach from session: prefix + d
Navigation between Sessions: prefix + s
Delete current session: tmux kill-session

### Windows
Create window: prefix + c
Rename current window: prefix + ,
Navigation between windows: prefix + number

### Panes
Vertical pane: prefix + %
Horizontal pane: prefix + "
Navigation between pane: prefix + arrows
Delete pane: prefix + x
