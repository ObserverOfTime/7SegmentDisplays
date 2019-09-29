@include "readfile"

BEGIN {
    IGNORECASE = 1
    invalid = "[gkmqvwxzio]"
    split(readfile("words.txt"), words, "\n")

    for(i = 1; i <= length(words); ++i) {
        word = words[i]
        wlen = length(word)
        if(wlen == maxlen && word !~ invalid) {
            longest[++i] = word
        } else if(wlen > maxlen && word !~ invalid) {
            delete longest
            longest[++i] = word
            maxlen = wlen
        }
    }

    for(l in longest) print longest[l]
}
