let s:longest = []
let s:invalid = '[gkmqvwxzio]'
let s:maxlen = 0

for s:word in readfile('words.txt', 'b')
    let s:wlen = len(s:word)
    if s:wlen == s:maxlen
        if s:word !~? s:invalid
            let s:longest += [s:word]
        endif
    elseif s:wlen > s:maxlen
        if s:word !~? s:invalid
            let s:longest = [s:word]
            let s:maxlen = s:wlen
        endif
    endif
endfor

echo join(s:longest, "\n") ."\n"

" No tests because capturing the output is tricky

