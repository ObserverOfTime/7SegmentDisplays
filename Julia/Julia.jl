longest = String[]
max_len = 0
invalid(word) = occursin(r"[gkmqvwxzio]"i, word)

for word in eachline(open("words.txt", "r"))
    global max_len
    if !invalid(word) && length(word) ≥ max_len
        if length(word) > max_len
            empty!(longest)
        end
        push!(longest, word)
        max_len = length(word)
    end
end

for i in longest ; println(i) ; end
