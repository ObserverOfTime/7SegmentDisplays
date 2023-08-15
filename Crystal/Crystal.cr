longest = [] of String
invalid = /[gkmqvwxzio]/i
maxlen = 0

File.open("words.txt").each_line do |word|
    if word.size == maxlen && word !~ invalid
        longest << word
    elsif word.size > maxlen && word !~ invalid
        longest.clear << word
        maxlen = word.size
    end
end

puts longest.join("\n")
