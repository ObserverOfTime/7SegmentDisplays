words = require('fs').readFileSync 'words.txt', 'utf-8'
invalid = (s) -> /[gkmqvwxzio]/i.test s
longest = []
maxlen = 0

for word in words.split '\n'
    if word.length == maxlen && !invalid word
        longest.push word
    else if word.length > maxlen && !invalid word
        longest = [word]
        maxlen = word.length

console.log longest.join '\n'

