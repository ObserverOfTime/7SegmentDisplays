require! fs: {createReadStream}, readline: {createInterface}
invalid = (s) -> /[gkmqvwxzio]/i.test s
longest = []
maxlen = 0

createInterface input: createReadStream 'words.txt'
    .on 'line', (word) !->
        if word.length is maxlen and not invalid word then
            longest.push word
        else if word.length > maxlen and not invalid word then
            longest := [word]
            maxlen := word.length
    .on 'close', !-> console.log longest.join '\n'

