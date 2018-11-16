function! s:GetLongest()
    let l:longest = []
    let l:invalid = '[gkmqvwxzio]'
    let l:maxlen = 0

    for l:word in readfile('words.txt')
        let l:wlen = len(l:word)
        if l:wlen == l:maxlen
            if l:word !~? l:invalid
                let l:longest += [l:word]
            endif
        elseif l:wlen > l:maxlen
            if l:word !~? l:invalid
                let l:longest = [l:word]
                let l:maxlen = l:wlen
            endif
        endif
    endfor
    return l:longest
endfunction

echo join(s:GetLongest(), "\n") ."\n"

