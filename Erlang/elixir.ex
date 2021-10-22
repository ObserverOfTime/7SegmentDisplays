invalid = ~r/[gkmqvwxzio]/i

{:ok, contents} = File.read("words.txt")

{longest, maxlen} = contents
    |> String.split("\n", trim: true)
    |> Enum.map_reduce(0, fn word, acc ->
        size = byte_size(word)
        if size >= acc && !String.match?(word, invalid) do
            {word, size}
        else
            {nil, acc}
        end
    end)

longest
    |> Enum.reject(fn word ->
        is_nil(word) || byte_size(word) != maxlen
    end)
    |> Enum.each(&(IO.puts(&1)))
