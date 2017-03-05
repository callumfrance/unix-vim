" MacVim GUI mode
if has("gui_macvim")
  " defaults{
  set guifont=Monaco:h13
  set guioptions=aAce
  set fuoptions=maxvert,maxhorz
  set noballooneval
  winpos 700 0
 " }
 
 " automaticall resizes splits when resizing window
  autocmd VimResized * wincmd = 
 
 endif
