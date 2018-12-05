const words = require 'fs' .readFileSync 'words.txt'
invalid = (s) -> /[gkmqvwxzio]/i.test s
longest = []
maxlen = 0

for word in words.toString!split '\n'
    if word.length is maxlen then
        longest.push word if not invalid word
    else if word.length > maxlen then
        longest := [word] if not invalid word
        maxlen := (longest.0 or '').length

console.log longest.join '\n'

