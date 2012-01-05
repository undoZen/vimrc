fun! s:OpenLink()
    normal yi(
    let path = @"
    normal y1h
    if @" == '('
        " we are in parentheses
        if strpart(path, 0, 1) != '.'
            echo 'OpenLink() only work with relative path.'
            return
        endif
        if match(path, '/$') > -1
            let path = path . 'index.md'
        elseif match(path, '.html$') > -1
            let path = strpart(path, 0, strlen(path) - 5) . '.md'
            echo path
        elseif match(path, '.md$') == -1
            let path = path . '.md'
        endif
        let path = simplify(expand("%:p:h") . '/' . path)
        let dir = strpart(path, 0, strridx(path, '/'))
        if !isdirectory(dir)
            exec '!mkdir -p ' . dir
        endif
        write
        exec ':edit ' . path
    else
        normal yi[
        let path = @"
        normal y1h
        if @" == '['
            " we are in square brackets
            normal f]y2l
            if strpart(@", 1, 2) == '('
                normal f(
                call s:OpenLink()
            else
                exec 'normal a(./' . path . '.md)'
            endif
        else
            echo 'use OpenLink() in parenteses or square brackets'
        endif
    endif
endf
nmap <script> K :call <SID>OpenLink()<CR>
