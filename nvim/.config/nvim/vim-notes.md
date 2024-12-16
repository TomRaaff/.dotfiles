# VIM COMMANDS

-----------------------
## MODES
-----------------------
- Normal mode
- Insert mode
- Visual mode 
- Command mode
- Visual block mode

-----------------------
## SWITCH BETWEEN MODES
-----------------------
- insert: i
- insert at beginning of the line: I
- insert AFTER the caret: a
- insert as end of line: A
- insert on a new line BELOW the caret: o
- insert on a new line ABOVE the caret: O
- exit insert mode: esc or ctrl+[
Visual mode
- select from cursor: v
- select line: V 
Command mode
- from normal mode: : 
Visual block mode: ctrl + v


-----------------------
## MOTIONS
-----------------------
- left: h
- down: j
- up: k
- right: l
- jump word left: b
- jump to next word begin: w
- jump to next word end: e
- to end of line: $ 
- to start of line: 0
- to start of text: ^
- scroll up: ctrl + u
- scroll down: ctrl + d


## BIG MOTIONS
- jump x amount of lines/characters: {count}{motion} 
	ie: '12w' moves 12 words forward
	this also works with bigger motions like $ or %
	
- jump to paragraph:
	previous: {
	next: }

- jump between matching parentheses or brackets: %
- go back in the jumplist: ctrl + o
- next in the jumplist: ctrl + i


-----------------------
## NORMAL MODE (EDITING) 
-----------------------
- delete selector: d + movement (could be an entire word)
- delete line: dd
- delete text of the line: D
- delete: x
- undo: u
- redo: ctrl + r
- replace character: r
- replace: c 
    (delete and enter insert-mode)
- replace current line: cc
- repeat command: .
- delete linebreak: J
    (aka join lines)
- copy: y
- copy line: yy
- paste: p
    If you delete an entire line, the p command puts the text line below
    the cursor. If you delete part of a line (a word, for instance), the p
    command puts it just after the cursor.
- copy file: :w !pbcopy
- copy to clipboard: make a selection + "*y
- format selection: =
- indent right: >>
- indent left: <<

-----------------------
## FIND
-----------------------
- find char: f
- find char backwards: F
- next occurrance of char: ;
- next occurrance of word: *
- previous occurrance of word: #
- a piece of text: /{text} enter
	- next result: n
	- previous result: N

-----------------------
## FILE NAVIGATION
-----------------------
- explore the file system: ':Ex'
- go to previous file: ctrl + 6

-----------------------
## COMMAND COUNT MOTION
-----------------------
This is how you do combo's. For example: y14j will yank the next 14 lines down.


-----------------------
## SUPER POWER COMBO'S
-----------------------
- delete content of a code block:
	navigate inside a code block
	enter: ci{
- Select content of a code block:
	navigate inside a code block
	enter: vi{
- delete word: diw
- delete word including next space: daw
- select content of parantheses: vi(

-----------------------
## MULTI EDITING
-----------------------
- comment a section:
    1. ctrl + v to enter visual block mode
    2. create selection
    3. shift + I to enter insert mode
    4. esc to apply the insertion
- uncomment a section
    1. ctrl + v to enter visual block mode
    2. create selection
    3. d to delete the selection

- indent file: gg=G

-----------------------
## Windows and splits
-----------------------
- split tab vertically: crtl + w + v
- split tab horizontally: crtl + w + s
- navigate tabs: ctrl + h/j/k/l

### modify window size
- ctrl+w =: equalize width and height of all windows
- see plugin notes: smart-splits

-----------------------
## PRACTICE THESE 
-----------------------
- split tab vertically: crtl + w + v
- split tab horizontally: crtl + w + s
- navigate tabs: ctrl + h/j/k/l
- jump parentheses: % 
- go back in the jumplist: ctrl + o
- next in the jumplist: ctrl + i


