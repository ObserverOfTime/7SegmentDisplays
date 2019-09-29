package main

import ("fmt"; "io/ioutil"; "strings")

func invalid(word string) bool {
    return strings.ContainsAny(strings.ToLower(word), "gkmqvwxzio");
}

func main() {
    var longest []string
    words, _ := ioutil.ReadFile("words.txt")
    maxlen := 0

    for _, word := range strings.Split(string(words), "\n") {
        if len(word) == maxlen && !invalid(word) {
            longest = append(longest, word)
        } else if len(word) > maxlen && !invalid(word) {
            longest = []string{word}
            maxlen = len(word)
        }
    }

    fmt.Println(strings.Join(longest, "\n"))
}
