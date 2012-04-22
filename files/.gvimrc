if has("gui_macvim")

  " set font size
  set guifont=Menlo:h13

  " remap CtrlP key
  macmenu &File.New\ Tab key=<D-s-t>
  map <D-t> :CtrlP<CR>

  " remap Ack key
  macmenu &Edit.Find.Find\.\.\. key=<D-s-f>
  map <D-f> :Ack<space>

  " map Command-/
  map <D-/> <leader>cl

  " map Command-r to delete all whitespace
  map <D-r> :%s/\s\+$//<CR>
endif

