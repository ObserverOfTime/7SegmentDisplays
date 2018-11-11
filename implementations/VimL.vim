function! s:GetLongest()
    let l:words = readfile('words.txt')
    let l:longest = []
    let l:invalid = '[gkmqvwxzio]'

    for l:word in l:words
        let l:len = len(get(l:longest, 0, ''))
        if len(l:word) == l:len
            if l:word !~? l:invalid
                let l:longest += [l:word]
            endif
        elseif len(l:word) > l:len
            if l:word !~? l:invalid
                let l:longest = [l:word]
            endif
        endif
    endfor
    return l:longest
endfunction

echo join(s:GetLongest(), "\n")

