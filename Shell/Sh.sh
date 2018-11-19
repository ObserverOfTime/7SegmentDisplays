#!/bin/sh

for word in $(grep -Ev '[gkmqvwxzio]' words.txt); do
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

# No tests because it takes 2.5 minutes to run

