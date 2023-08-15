maxlen=0

grep -Eiv '[gkmqvwxzio]' words.txt | {
    while read -r word; do
        wlen="$(printf '%s' "$word" | wc -m)"
        if [ "$wlen" -eq "$maxlen" ]; then
            if [ -z "$longest" ]; then longest="$word"
            else longest="$longest\\n$word"; fi
        elif [ "$wlen" -gt "$maxlen" ]; then
            longest="$word"
            maxlen="$wlen"
        fi
    done

    printf '%b\n' "$longest"
}

# No tests because it takes around 2 minutes to run
