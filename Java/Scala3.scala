import scala.io.Source

@main def Scala7SegmentDisplays() = {
    val invalid = "(?i).*[gkmqvwxzio].*".r

    val (longest, _) = Source.fromFile("words.txt").getLines()
        .foldLeft((List.empty[String], 0)) {
            case ((acc, maxlen), word)
                if word.length == maxlen && !invalid.matches(word) =>
                    (word :: acc, maxlen)

            case ((_, maxlen), word)
                if word.length > maxlen && !invalid.matches(word) =>
                    (List(word), word.length)

            case (acc, _) =>
                acc
        }

    longest.reverse.foreach(println)
}
