def longest = []
def invalid = "(?i).*[gkmqvwxzio].*"
def maxlen = 0

new java.io.File("words.txt").eachLine {
    if(it.length() == maxlen && !it.matches(invalid)) {
        longest.add(it)
    } else if(it.length() > maxlen && !it.matches(invalid)) {
        longest.clear()
        longest.add(it)
        maxlen = it.length()
    }
}

longest.each { println it }

