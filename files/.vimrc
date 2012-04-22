"
" Settings
"

" General
set nocompatible        " use vim defaults
set ai                  " auto indenting
set history=1000        " keep 1000 lines of history
set hlsearch            " highlight the last searched term
set ignorecase          " searches are case insensitive ...
set smartcase           " ... unless they contain at least one capital letter
set showmatch		        " show matching brackets
set wrap		            " wrap lines
set autoindent		      " indent at same level as last line
set tabstop=2	          " backspace deletes a 'tab'
set shiftwidth=2	      " a tab is 2 space
set expandtab		        " use spaces not tabs
set encoding=utf-8
let mapleader = ','     " remap map leader
nnoremap ; :            " Make ; work like :

" Appearance
color solarized
syntax on               " syntax highlighting
set number		          " line numbers on
set ruler               " show the cursor position
set guioptions-=T	      " hide toolbar
set guioptions-=r	      " hide right scrollbar

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set list!

" Misc
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

" Status line
if has("statusline") && !&cp
  set laststatus=2                " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif


"
" Mappings
"

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk


"
" Plugins
"

filetype plugin indent on         " use the file type plugins

" CtrlP

" Open selected file in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*


"
" Backup and swap
"

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_swap//      " where to put swap files.

