#!/usr/bin/env groovy

import java.io.File

def longest = []
def invalid = ".*[gkmqvwxzio].*"
def maxlen = 0

new File("words.txt").eachLine {
    if(it.length() == maxlen) {
        if(!it.matches(invalid)) {
            longest.add(it)
        }
    } else if(it.length() > maxlen) {
        if(!it.matches(invalid)) {
            longest.clear()
            longest.add(it)
            maxlen = it.length()
        }
    }
}

longest.each { println it }

