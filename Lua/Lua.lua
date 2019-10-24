local words = {}
local maxlen = 0
local invalid = '[gkmqvwxzioGKMQVWXZIO]'
local txt = io.open('words.txt', 'r')

for word in txt:lines() do
    if not word:find(invalid) then
        if word:len() == maxlen then
            table.insert(words, word)
        elseif word:len() > maxlen then
            words = {word}
            maxlen = word:len()
        end
    end
end
txt:close()

print(table.concat(words, '\n'))
