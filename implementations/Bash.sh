mapfile -t words < words.txt
longest=()
invalid='[gkmqvwxzio]'

for word in "${words[@]}"; do
  if [ ${#word} -eq ${#longest[0]} ]; then
    [[ $word =~ $invalid ]] || longest+=("$word")
  elif [ ${#word} -gt ${#longest[0]} ]; then
    [[ $word =~ $invalid ]] || longest=("$word")
  fi
done

printf '%s\n' "${longest[@]}"

