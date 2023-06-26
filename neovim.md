## NeoVim cheat sheet

### keybindings

`i` - toggle to insert mode  
`ESC` - toggle to normal mode  
`a` - toggle to insert mode appending  
`o` - toggle to insert mode creating a new line  
`I` - toggle to insert mode in the beggining of line  
`A` - toggle to insert mode in the end of line  
`O` - toggle to insert mode create a new line above current line  
`x` - delete current character  
`dd` - delete line  
`<number><key>` - execute command <key> <number> of times (e.g. 10dd will delete 10 lines)  
`$` - go to the end of line  
`u` - undo  
`^R` - redo  
`v` - toggle to visual mode (in this mode, the navigation will select text)  
`d` - deletes something (e.g. dw - delete word, dd - delete line, d with some text select will delete selected text)  
`y` - copy  
`p` - paste  
`yy` - copy line  
`P` - paste above current line/cursor  
`cc` - delete line and toggles the insert mode  
`c` - deletes something toggling the insert mode  
`D` - deletes from current place to the end of line  
`C` - change (delete and toggle the insert mode) until the end of line  
`r` - replace the current character by the next char you type  
`w` - jump to the next word  
`W` - jump to the next word (just considering space as separator)  
`b` - jump to the previous word  
`B` - jump to the previous word (just considering space as separator)  
`dw` - deletes until the end of current word  
`diw` - delete current word  
`d<n>w` - delete n next words  
`d<n>b` - delete n previous words  
`e` - jump to the end of next word  
`0` - go to the beggining of line  
`d0` - delete until the beggining of line  
`d$` - delete until the end of line  
`%` - jump to the matching curly brace  
`f<char>` - jump to the next <char>  
`t<char>` - jump to one char before next <char>  
`F<char>` - jump to the previous <char>  
`T<char>` - jump to one char after previous <char>  
`gg` - go to beggining of file  
`G` - go to end of file  
`<n>G` - jump to the <n> line  
`>>` - indent to right  
`<<` - indent to left  
`V` - visual line mode  
`^V` - visual block (column) mode  
`==` - indent line correctly  
`/<word>` - search word  
`?<word>` - search word backwards  
`*` - search for the current word  
`#` - search for the current word backwards  
`m<char>` - create a bookmark represented by <char>  
`'<char>` - jump to the <char> bookmark  
`zz` - put the current line in the center of screen  
`.` - repeat last command  
`"<n>p` - paste register 7  
`q<char>` - record macro represented by <char>  
`@<char>` - execute macro represented by <char>  

### concepts

`i` - inner  
`w` - word  
`d` - delete  
`c` - change  
`b` - previous word  
`y` - yank (copy)  
`p` - print (paste)  
`f` - find  

### commands

`set number` - show line numbers  
`set relativenumber` - show line relative numbers  
`coloscheme <scheme>` - sets color scheme (use TAB to list options)  
`<n>` - jump to the <n> line  
`%s/<word>/<replacement>/g` - replace <word> by <replacement> in all file  
`s/<word>/<replacement>/g` - replace <word> by <replacement> in current selection  
`reg` - list current registers  
