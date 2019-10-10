import scala.collection.mutable.ListBuffer
import scala.io.Source

object Scala7SegmentDisplays {
    def main(args: Array[String]): Unit = {
        val longest: ListBuffer[String] = ListBuffer()
        val invalid: String = "(?i).*[gkmqvwxzio].*"
        var maxlen: Int = 0

        Source.fromFile("words.txt").getLines.foreach(word =>
            if(word.length == maxlen && !word.matches(invalid)) {
                longest.append(word)
            } else if(word.length > maxlen && !word.matches(invalid)) {
                longest.clear
                longest.append(word)
                maxlen = word.length
            }
        )

        longest.foreach { println }
    }
}
