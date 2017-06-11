" Only do this when not done yet for this buffer
if exists("b:did_ftplugin") && b:did_ftplugin == 1
  finish
endif

let b:did_ftplugin = 1

setlocal textwidth=80
setlocal formatprg=pandoc\ -f\ markdown\ -t\ html\ \|\ pandoc\ -f\ html\ -t\ markdown

function! s:underline(c)
    let l:cursor = getcurpos()
    let l:old_register = @"
    normal k0v$hy
    call setpos('.', l:cursor)
    normal p0
    let l:command = 's/./' . a:c . '/g'
    execute l:command
    normal o
    let @" = l:old_register
endfunction

inoremap === <esc>:call <SID>underline('=')<cr>i
inoremap --- <esc>:call <SID>underline('-')<cr>i
