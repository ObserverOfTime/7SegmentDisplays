#!/usr/bin/awk -f

BEGIN {
    invalid = "[gkmqvwxzio]"

    while((getline < "words.txt") > 0) {
        wlen = length($0)
        if(wlen == maxlen && $0 !~ invalid) {
            longest[$0] = $0
        } else if(wlen > maxlen && $0 !~ invalid) {
            delete longest
            longest[$0] = $0
            maxlen = wlen
        }
    }

    for(l in longest) print l
}

