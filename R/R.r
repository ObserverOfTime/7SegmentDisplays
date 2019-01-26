#!/usr/bin/env Rscript

longest <- NULL
maxlen <- 0
invalid <- function(s) grepl("[gkmqvwxzio]", s, TRUE)

for(word in readLines("words.txt")) {
    wlen <- nchar(word)
    if(wlen == maxlen && !invalid(word)) {
        longest <- c(longest, word)
    } else if(wlen > maxlen && !invalid(word)) {
        longest <- c(word)
        maxlen <- nchar(word)
    }
}

cat(longest, sep="\n")

