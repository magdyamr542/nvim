fun! ReplaceAll()
  let wordUnderCursor = expand("<cword>")
  let command = ":%s/" . wordUnderCursor . "//g\<LEFT>\<LEFT>"
  call feedkeys(command) 
endfun


fun! CloseVim()
       execute ":wqa"
endfun
