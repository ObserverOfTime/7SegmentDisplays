# 7SegmentDisplays

Print the longest English word(s) in [dwyl/english-words][words]
that can be written with a [Seven-segment display][SSD].<br>
Based on Tom Scott's [The Basics S2E1][TB21]
and implemented in multiple languages.

[words]: https://github.com/dwyl/english-words
[SSD]: https://en.wikipedia.org/wiki/Seven-segment_display
[TB21]: https://www.youtube.com/watch?v=zp4BMR88260

## Languages

These are the currently implemented languages:

* [Awk](Awk/Awk.awk)
* [Bash](Shell/Bash.sh)
* [C#](C/C#.cs)
* [C++](C/C++.cpp)
* [CMake](CMake/CMake.cmake)
* [CoffeeScript](JavaScript/CoffeeScript.coffee)
* [D](D/D.d)
* [Delphi](Pascal/Delphi.pas)
* [Gawk](Awk/Gawk.awk)
* [Go](Go/Go.go)
* [Groovy](Groovy/Groovy.groovy)
* [JavaScript](JavaScript/JavaScript.js)
* [Java](Java/Java.java)
* [Kotlin](Kotlin/Kotlin.kt)
* [LiveScript](JavaScript/LiveScript.ls)
* [MySQL](SQL/MySQL.sql)
* [Pascal](Pascal/Pascal.pas)
* [Python2](Python/Python2.py)
* [Python3](Python/Python3.py)
* [Python](Python/Python.py)
* [R](R/R.r)
* [SQLite](SQL/SQLite.sql)
* [Scala](Scala/Scala.scala)
* [TypeScript](JavaScript/TypeScript.ts)
* [VimL](VimL/VimL.vim)
* [Zsh](Shell/Zsh.sh)

To add an implementation in a new language,
or improve an existing implementation,
check [CONTRIBUTING.md](CONTRIBUTING.md).

## Benchmarks

You can see the current benchmarks in [BENCHMARKS.md](BENCHMARKS.md).
To run your own benchmarks (`make && make bench`) you will need
[hyperfine][hf] and a compiler/runtime environment for every language.

[hf]: https://github.com/sharkdp/hyperfine

## Credits

* [Tom Scott][Tom Scott] for the idea and original implementation.
* [dwyl][dwyl] for the English dictionary ([words.txt](words.txt)).

[Tom Scott]: https://twitter.com/tomscott
[dwyl]: https://github.com/dwyl/english-words/graphs/contributors

## TODO

* More languages.
* Tests.
* Travis?

## License

Licensed under [GLWTPL](LICENSE).

