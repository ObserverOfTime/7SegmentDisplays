#!/usr/bin/gawk -f

@include "readfile"

BEGIN {
    invalid = "[gkmqvwxzio]"
    split(readfile("words.txt"), words, "\n")

    for(i = 1; i <= length(words); ++i) {
        word = words[i]
        wlen = length(word)
        if(wlen == maxlen && word !~ invalid) {
            longest[word] = word
        } else if(wlen > maxlen && word !~ invalid) {
            delete longest
            longest[word] = word
            maxlen = wlen
        }
    }

    for(l in longest) print l
}

