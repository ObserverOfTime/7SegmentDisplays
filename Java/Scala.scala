import scala.collection.mutable.ListBuffer
import scala.io.Source

object Scala7SegmentDisplays extends App {
    val longest = ListBuffer[String]()
    val invalid = "(?i).*[gkmqvwxzio].*"
    var maxlen = 0

    Source.fromFile("words.txt").getLines().foreach(word =>
        if (word.length == maxlen && !word.matches(invalid)) {
            longest.append(word)
        } else if (word.length > maxlen && !word.matches(invalid)) {
            longest.clear()
            longest.append(word)
            maxlen = word.length
        }
    )

    longest.foreach { println }
}
