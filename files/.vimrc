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
set showmatch           " show matching brackets
set wrap                " wrap lines
set autoindent          " indent at same level as last line
set tabstop=2           " backspace deletes a 'tab'
set shiftwidth=2        " a tab is 2 space
set expandtab           " use spaces not tabs
set encoding=utf-8
let mapleader = ','     " remap map leader

" Appearance
color solarized
let g:solarized_visibility = 'high'

syntax on               " syntax highlighting

set number              " line numbers on
set ruler               " show the cursor position
set guioptions-=T       " hide toolbar
set guioptions-=r       " hide right scrollbar

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:·            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set list!

" Make the 81st column stand out
highlight ColorColumn ctermbg=white
set colorcolumn=81

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

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Convert Ruby 1.8 hash to 1.9 syntax
command -range=% To19 :<line1>,<line2>s/:\([^ ]\+\) \+=> \+/\1: /g

" Convert -%> to %>
command -range=% NoMinus :<line1>,<line2>s/-%>/%>/g

" Map %% to current dir and expand immediately
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Clear search highlighting with Escape
nnoremap <esc> :noh<return><esc>

" Close all tabs except the active one with Cmd-d
nnoremap <D-d> :tabonly<return>

" Use ; as : alternative
nnoremap ; :


"
" Plugins / Vundle
"
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/YankRing.vim.git'

call vundle#end()
filetype plugin indent on

" CtrlP: Open selected file in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" CtrlP:
" * Disable output and VCS files
" * Disable archive files
" * Ignore bundler and sass cache
" * Disable temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" YankRing: Set path for history
let g:yankring_history_dir = '~/.vim'

" Enable matchit plugin
"runtime macros/matchit.vim

" Dragvisuals
"runtime plugin/dragvisuals.vim

" Use arrow keys to drag block around
"vmap  <expr>  <LEFT>   DVB_Drag('left')
"vmap  <expr>  <RIGHT>  DVB_Drag('right')
"vmap  <expr>  <DOWN>   DVB_Drag('down')
"vmap  <expr>  <UP>     DVB_Drag('up')
"vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
"let g:DVB_TrimWS = 1


"
" Backup and swap
"

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_swap//      " where to put swap files.

" Make git gutter use same background as line numbers
"highlight clear SignColumn

