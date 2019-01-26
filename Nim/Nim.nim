import nre

var
    longest: seq[string]
    words: File
    word: string
    maxlen: int = 0

proc invalid(s: string): bool =
    s.contains(re"(?i)[gkmqvwxzio]")

if open(words, "words.txt"):
    while words.readLine(word):
        if word.len == maxlen and not invalid(word):
            longest.add(word)
        elif word.len > maxlen and not invalid(word):
            longest = @[word]
            maxlen = word.len

for l in items(longest): echo l

