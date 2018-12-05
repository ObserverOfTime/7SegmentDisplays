package main

import ("fmt"; "io/ioutil"; "regexp"; "strings")

func main() {
    var longest []string
    words, _ := ioutil.ReadFile("words.txt")
    invalid, _ := regexp.Compile("(?i)[gkmqvwxzio]")
    maxlen := 0

    for _, word := range strings.Split(string(words), "\n") {
        wlen := len(word)
        if wlen == maxlen && !invalid.MatchString(word) {
            longest = append(longest, word)
        } else if wlen > maxlen && !invalid.MatchString(word) {
            longest = []string{word}
            maxlen = wlen
        }
    }

    fmt.Println(strings.Join(longest, "\n"))
}

