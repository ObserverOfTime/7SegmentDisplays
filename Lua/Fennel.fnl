(var words [])
(var maxlen 0)
(local invalid "[gkmqvwxzio]")

(each [word (io.lines "words.txt")]
  (if (not (string.find (word:lower) invalid))
      (if (= (word:len) maxlen)
          (table.insert words word)
          (> (word:len) maxlen)
          (do
            (set words [word])
            (set maxlen (word:len))))))

(print (table.concat words "\n"))
