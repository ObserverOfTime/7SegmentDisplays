BEGIN {
    invalid = "[GKMQVWXZIOgkmqvwxzio]"

    while((getline < "words.txt") > 0) {
        wlen = length($0)
        if(wlen == maxlen && $0 !~ invalid) {
            longest[++i] = $0
        } else if(wlen > maxlen && $0 !~ invalid) {
            delete longest
            longest[++i] = $0
            maxlen = wlen
        }
    }

    for(l in longest) print longest[l]
}

