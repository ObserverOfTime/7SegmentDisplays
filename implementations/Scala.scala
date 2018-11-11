import scala.collection.mutable.ListBuffer
import scala.io.Source

object Scala7SegmentDisplays {
  def main(args: Array[String]): Unit = {
    val words = Source.fromFile("words.txt").getLines.toList
    val longest: ListBuffer[String] = ListBuffer()
    val invalid: String = ".*[gkmqvwxzio].*"

    for(word <- words) {
      val len: Int = longest.headOption.getOrElse("").length
      if(word.length == len) {
        if(!word.matches(invalid)) {
          longest.append(word)
        }
      } else if(word.length > len) {
        if(!word.matches(invalid)) {
          longest.clear
          longest.append(word)
        }
      }
    }

    longest.foreach(System.out.println)
  }
}

