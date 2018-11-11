words = require('fs').readFileSync 'words.txt', 'utf-8'
invalid = (s) -> /[gkmqvwxzio]/.test s
longest = []
len = 0

for word in words.split '\n'
  len = (longest.0 or '').length
  if word.length == len then
    longest.push word if not invalid word
  else if word.length > len then
    longest = [word] if not invalid word

console.log longest.join '\n'

