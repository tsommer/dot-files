if has("gui_macvim")

  " set font size
  set guifont=Menlo:h13

  " remap CtrlP key
  macmenu &File.New\ Tab key=<D-s-t>
  map <D-t> :CtrlP<CR>

  " remap Ack key
  macmenu &Edit.Find.Find\.\.\. key=<D-s-f>
  map <D-f> :Ack<space>
endif

