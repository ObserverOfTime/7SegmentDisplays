import java.io.File

fun main(args: Array<String>) {
    val words = File("words.txt").useLines { it.toList() }
    val longest = mutableListOf<String>()
    val invalid = ".*[gkmqvwxzio].*".toRegex()

    for(word in words) {
        val len = longest.firstOrNull()?.length ?: 0
        if(word.length == len) {
            if(!word.matches(invalid)) {
                longest.add(word)
            }
        } else if(word.length > len) {
            if(!word.matches(invalid)) {
                longest.clear()
                longest.add(word)
            }
        }
    }

    longest.forEach(::println)
}

