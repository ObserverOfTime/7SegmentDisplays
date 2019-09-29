invalid = (s) -> /[gkmqvwxzio]/i.test s
longest = []
maxlen = 0

require('readline').createInterface
    input: require('fs').createReadStream 'words.txt'
.on 'line', (word) ->
    if word.length == maxlen && !invalid word
        longest.push word
    else if word.length > maxlen && !invalid word
        longest = [word]
        maxlen = word.length
.on 'close', -> console.log longest.join '\n'
