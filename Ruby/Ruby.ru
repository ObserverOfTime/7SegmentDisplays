longest = Array.new
invalid = /[gkmqvwxzio]/i
maxlen = 0

File.open("words.txt").each_line do |word|
    if word.length == maxlen && word !~ invalid
        longest.push(word)
    elsif word.length > maxlen && word !~ invalid
        longest.clear
        longest.push(word)
        maxlen = word.length
    end
end

puts longest
