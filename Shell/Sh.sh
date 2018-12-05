#!/bin/sh

maxlen=0

grep -Eiv '[gkmqvwxzio]' words.txt | {
    while read -r word; do
        wlen="$(expr length "$word")"
        if [ "$wlen" -eq "$maxlen" ]; then
            if [ -z "$longest" ]; then longest="$word"
            else longest="$longest $word"; fi
            maxlen="$(expr length "$word")"
        elif [ "$wlen" -gt "$maxlen" ]; then
            longest="$word"
            maxlen="$(expr length "$word")"
        fi
    done

    echo "$longest" | tr ' ' '\n'
}

# No tests because it takes over 2 minutes to run

