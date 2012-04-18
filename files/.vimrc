" General
set ai                  " auto indenting
set history=1000        " keep 1000 lines of history
set ruler               " show the cursor position
syntax on               " syntax highlighting
set hlsearch            " highlight the last searched term
filetype plugin on      " use the file type plugins
set showmatch		" show matching brackets
set nowrap		" wrap lines
set autoindent		" indent at same level as last line
set expandtab		" use spaces not tabs
set shiftwidth=2	" a tab is 2 space
set softtabstop=2	" backspace deletes a 'tab'
 
" Appearance
color solarized
set nu			" line numbers on
set guioptions-=T	" hide toolbar
set guioptions-=r	" hide right scrollbar

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

