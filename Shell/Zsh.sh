typeset -a longest
invalid='[gkmqvwxzio]'

foreach word ($(<words.txt))
    if (($#word == $#longest[1])) {
        [[ $word:l =~ $invalid ]] || longest+=("$word")
    } elif (($#word > $#longest[1])) {
        [[ $word:l =~ $invalid ]] || longest=("$word")
    }
end

printf '%s\n' "${(@)longest}"

