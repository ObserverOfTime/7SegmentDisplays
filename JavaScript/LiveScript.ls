invalid = (s) -> /[gkmqvwxzio]/.test s
longest = []
maxlen = 0
require 'fs' .createReadStream 'words.txt'
    .on 'data', (data) ->
        for word in data.toString!split '\n'
            if word.length is maxlen then
                longest.push word if not invalid word
            else if word.length > maxlen then
                longest := [word] if not invalid word
        maxlen := (longest.0 or '').length
    .on 'close', ->
        console.log longest.join '\n'

