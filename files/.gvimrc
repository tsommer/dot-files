if has("gui_macvim")

  " remap CtrlP key
  macmenu &File.New\ Tab key=<D-s-t>
  map <D-t> :CtrlP<CR>

  macmenu &Edit.Find.Find\.\.\. key=<D-s-f>
  map <D-f> :Ack<space>
endif

