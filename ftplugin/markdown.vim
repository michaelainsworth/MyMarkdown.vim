" Only do this when not done yet for this buffer
if exists("b:did_ftplugin") && b:did_ftplugin == 1
  finish
endif

let b:did_ftplugin = 1

setlocal textwidth=80
setlocal formatprg=pandoc\ -f\ markdown\ -t\ html\ \|\ pandoc\ -f\ html\ -t\ markdown\ --markdown-headings=atx

function! MarkdownToDoc()
    let l:source = expand('%:p')
    let l:destination = substitute(l:source, '^\(.*\)\.markdown$', '\1.odt', 'g')

    if l:source == l:destination
        return
    endif

    let l:command  = '!pandoc -f markdown -t odt -o '
    let l:command .= shellescape(l:destination) . ' '
    let l:command .= shellescape(l:source)
    silent execute l:command

    let l:command  = '!xdg-open ' . shellescape(l:destination) . ' '
    let l:command .= '> /dev/null 2>&1'
    silent execute l:command
endfunction

nnoremap <localleader>5 :call MarkdownToDoc()<cr>

