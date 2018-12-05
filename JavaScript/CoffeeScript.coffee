words = require('fs').readFileSync 'words.txt', 'utf-8'
invalid = (s) -> /[gkmqvwxzio]/i.test s
longest = []
maxlen = 0

for word in words.split '\n'
    if word.length == maxlen
        longest.push word if !invalid word
    else if word.length > maxlen
        longest = [word] if !invalid word
    maxlen = (longest[0] or '').length

console.log longest.join '\n'

