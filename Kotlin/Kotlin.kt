fun main(args: Array<String>) {
    val longest = mutableListOf<String>()
    val invalid = "(?i).*[gkmqvwxzio].*".toRegex()
    var maxlen = 0

    java.io.File("words.txt").forEachLine {
        if (it.length == maxlen && !it.matches(invalid)) {
            longest.add(it)
        } else if (it.length > maxlen && !it.matches(invalid)) {
            longest.clear()
            longest.add(it)
            maxlen = it.length
        }
    }

    longest.forEach { println(it) }
}
