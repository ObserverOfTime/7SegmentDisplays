package main

import ("fmt"; "io/ioutil"; "regexp"; "strings")

func main() {
    words_txt, _ := ioutil.ReadFile("words.txt")
    words := strings.Split(string(words_txt), "\n")
    invalid, _ := regexp.Compile("[gkmqvwxzio]")
    var longest []string

    for _, word := range words {
        _len := 0
        if len(longest) > 0 {
            _len = len(longest[0])
        }
        if len(word) == _len {
            if(!invalid.MatchString(word)) {
                longest = append(longest, word)
            }
        } else if len(word) > _len {
            if(!invalid.MatchString(word)) {
                longest = []string{word}
            }
        }
    }

    fmt.Println(strings.Join(longest, "\n"))
}

