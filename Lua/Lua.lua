local words = {}
local maxlen = 0
local invalid = '[gkmqvwxzio]'

for word in io.lines('words.txt') do
    if not word:lower():find(invalid) then
        if word:len() == maxlen then
            table.insert(words, word)
        elseif word:len() > maxlen then
            words = {word}
            maxlen = word:len()
        end
    end
end

print(table.concat(words, '\n'))
