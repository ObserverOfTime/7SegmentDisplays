const words = require 'fs' .readFileSync 'words.txt'
invalid = (s) -> /[gkmqvwxzio]/i.test s
longest = []
maxlen = 0

for word in words.toString!split '\n'
    if word.length is maxlen and not invalid word then
        longest.push word
    else if word.length > maxlen and not invalid word then
        longest := [word]
        maxlen := word.length

console.log longest.join '\n'

