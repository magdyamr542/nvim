" closing one buffer
nnoremap <c-w> :bd<CR> 

" closing all buffers
nnoremap <c-k><c-w>  :bufdo bwipeout<CR> 


" closes all other buffers but the opened one
function! CloseOtherBuffers()
    let l:bufnr = bufnr()
    execute "only"
    for buffer in getbufinfo()
        if !buffer.listed
            continue
        endif
        if buffer.bufnr == l:bufnr
            continue
        else
            if buffer.changed
                echo buffer.name . " has changed, save first"
                continue
            endif
            let l:cmd = "bdelete " . buffer.bufnr
            execute l:cmd
        endif
    endfor
endfunction

nnoremap <c-k><c-k> :call CloseOtherBuffers()<CR>
