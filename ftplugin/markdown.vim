" Only do this when not done yet for this buffer
if exists("b:did_ftplugin") && b:did_ftplugin == 1
  finish
endif

let b:did_ftplugin = 1

setlocal textwidth=80
setlocal formatprg=pandoc\ -f\ markdown\ -t\ html\ \|\ pandoc\ -f\ html\ -t\ markdown

