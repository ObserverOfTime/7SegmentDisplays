# 7SegmentDisplays [![build](https://github.com/ObserverOfTime/7SegmentDisplays/actions/workflows/build.yml/badge.svg)](https://github.com/ObserverOfTime/7SegmentDisplays/actions/workflows/build.yml)

Print the longest [English word(s)][words] that can be written with a [Seven-segment display][SSD].
<br/>Based on Tom Scott's [The Basics S2E1][TB21] and implemented in multiple languages.

[words]: https://github.com/dwyl/english-words
[SSD]: https://en.wikipedia.org/wiki/Seven-segment_display
[TB21]: https://www.youtube.com/watch?v=zp4BMR88260

## Languages

These are the currently implemented languages:

* [Awk](Awk/Awk.awk)
* [Bash](Shell/Bash.sh)
* [C](C/C.c)
* [C++](C/C++.cpp)
* [C#](C/C#.cs)
* [CMake](CMake/CMake.cmake)
* [CoffeeScript](JavaScript/CoffeeScript.coffee)
* [D](D/D.d)
* [Dart](Dart/Dart.dart)
* [Delphi](Pascal/Delphi.pas)
* [Elixir](Erlang/elixir.ex)
* [Erlang](Erlang/erlang.erl)
* [Gawk](Awk/Gawk.awk)
* [Go](Go/Go.go)
* [Groovy](Java/Groovy.groovy)
* [Java](Java/Java.java)
* [JavaScript](JavaScript/JavaScript.js)
* [Julia](Julia/Julia.jl)
* [Kotlin](Java/Kotlin.kt)
* [LiveScript](JavaScript/LiveScript.ls)
* [Lua](Lua/Lua.lua)
* [MySQL](SQL/MySQL.sql)
* [Nim](Nim/Nim.nim)
* [Pascal](Pascal/Pascal.pas)
* [Perl](Perl/Perl.pl)
* [Perl6](Perl/Perl6.p6)
* [PHP](PHP/PHP.php)
* [PostgreSQL](SQL/PostgreSQL.sql)
* [PowerShell](Shell/PowerShell.ps1)
* [Python](Python/Python.py)
* [R](R/R.r)
* [Ruby](Ruby/Ruby.rb)
* [Rust](Rust/rust.rs)
* [Scala](Java/Scala.scala)
* [Sh](Shell/Sh.sh)
* [SQLite](SQL/SQLite.sql)
* [TypeScript](JavaScript/TypeScript.ts)
* [Vala](C/Vala.vala)
* [VimL](VimL/VimL.vim)
* [Zsh](Shell/Zsh.sh)

To add an implementation in a new language,
or improve an existing implementation,
check [CONTRIBUTING](CONTRIBUTING.md).

## Tests

Tests are included in [`t/tests.t`](t/tests.t). To run them
(`make test`) you will need `perl` with the [`JSON::Parse`][JP]
module, and a compiler/runtime environment for every language.

[JP]: https://metacpan.org/pod/distribution/JSON-Parse/lib/JSON/Parse.pod

## Benchmarks

You can see the current benchmarks in [BENCHMARKS](BENCHMARKS.md).
To run your own benchmarks (`make bench`) you will need [hyperfine][hf],
and a compiler/runtime environment for every language.

[hf]: https://github.com/sharkdp/hyperfine

## Credits

* [Tom Scott][Tom Scott] for the idea and original implementation.
* [dwyl][dwyl] for the English dictionary ([words.txt](words.txt)).

[Tom Scott]: https://twitter.com/tomscott
[dwyl]: https://github.com/dwyl/english-words/graphs/contributors

## TODO

* [**More languages.**](https://github.com/ObserverOfTime/7SegmentDisplays/issues/3)

## License

Licensed under [GLWTPL](LICENSE.txt).
