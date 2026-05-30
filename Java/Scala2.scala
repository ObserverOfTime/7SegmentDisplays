import scala.collection.mutable.ListBuffer
import scala.io.Source

object Scala7SegmentDisplays extends App {
    val longest = ListBuffer.empty[String]
    val invalid = "(?i).*[gkmqvwxzio].*".r
    var maxlen = 0

    Source.fromFile("words.txt").getLines().foreach { word =>
        if (word.length == maxlen && !invalid.matches(word)) {
            longest += word
        } else if (word.length > maxlen && !invalid.matches(word)) {
            longest.clear()
            longest += word
            maxlen = word.length
        }
    }

    longest.foreach { println }
}
