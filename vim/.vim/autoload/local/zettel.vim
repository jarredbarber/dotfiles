func! local#zettel#edit(...)
    let l:sep = ''
    if len(a:000) > 0
        let l:sep='-'
    endif

    let l:fname = expand('~/notebook/zettel/') . strftime("%F") . l:sep . join(a:000, '-') . '.md'

    exec "e " . l:fname

    if len(a:000)  > 0
        exec "normal ggO# \<c-r>=strftime('%Y-%m-%d')\<cr> " . join(a:000) . "\<cr>\<esc>G"
    else
        exec "normal ggO# \<c-r>=strftime('%Y-%m-%d')\<cr>\<cr>\<esc>G"
    endif
endfunc
