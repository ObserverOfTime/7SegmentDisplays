| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `Rust/rust.out` | 16.5 ± 0.1 | 16.4 | 16.7 | 1.00 |
| `C/C.out` | 20.1 ± 0.3 | 19.9 | 20.7 | 1.22 ± 0.02 |
| `Go/Go.out` | 21.8 ± 1.8 | 20.2 | 25.5 | 1.32 ± 0.11 |
| `C/C++.out` | 24.5 ± 0.3 | 24.2 | 24.8 | 1.48 ± 0.02 |
| `Crystal/Crystal.out` | 35.0 ± 0.4 | 34.8 | 35.8 | 2.12 ± 0.03 |
| `Pascal/Pascal.out` | 45.8 ± 0.9 | 45.4 | 47.9 | 2.78 ± 0.06 |
| `php -n PHP/PHP.php` | 82.0 ± 0.3 | 81.7 | 82.4 | 4.97 ± 0.04 |
| `C/Vala.out` | 88.2 ± 0.5 | 87.9 | 89.4 | 5.35 ± 0.05 |
| `Nim/Nim.out` | 90.8 ± 0.7 | 90.2 | 92.3 | 5.50 ± 0.06 |
| `Dart/Dart.out` | 93.4 ± 0.7 | 92.5 | 94.3 | 5.66 ± 0.06 |
| `D/D.out` | 93.5 ± 0.1 | 93.3 | 93.7 | 5.67 ± 0.04 |
| `mono CSharp/C#.out` | 120.3 ± 0.9 | 119.5 | 122.1 | 7.29 ± 0.08 |
| `ruby Ruby/Ruby.rb` | 149.3 ± 0.7 | 148.4 | 150.5 | 9.05 ± 0.08 |
| `perl Perl/Perl.pl` | 153.3 ± 0.2 | 153.1 | 153.6 | 9.29 ± 0.07 |
| `node JavaScript/JavaScript.js` | 156.1 ± 4.1 | 151.5 | 164.2 | 9.46 ± 0.25 |
| `awk -f Awk/Awk.awk` | 157.8 ± 2.3 | 156.4 | 162.9 | 9.57 ± 0.15 |
| `python3 Python/Python.py` | 170.8 ± 8.3 | 164.4 | 187.6 | 10.35 ± 0.51 |
| `lsc JavaScript/LiveScript.ls` | 229.8 ± 2.7 | 225.0 | 232.9 | 13.94 ± 0.19 |
| `java -cp Java Java7SegmentDisplays` | 243.2 ± 29.1 | 216.4 | 300.7 | 14.75 ± 1.77 |
| `lua5.3 Lua/Lua.lua` | 276.6 ± 2.4 | 275.0 | 281.9 | 16.77 ± 0.19 |
| `gawk -f Awk/Gawk.awk` | 328.6 ± 0.6 | 327.9 | 329.2 | 19.92 ± 0.14 |
| `julia Julia/Julia.jl` | 339.7 ± 1.4 | 338.4 | 342.2 | 20.60 ± 0.17 |
| `kotlin -cp Java Kotlin7SegmentDisplays` | 370.2 ± 4.1 | 364.3 | 375.6 | 22.45 ± 0.29 |
| `escript -c Erlang/erlang.erl` | 423.2 ± 7.2 | 414.3 | 436.9 | 25.66 ± 0.47 |
| `fennel --no-fennelrc Lua/Fennel.fnl` | 427.4 ± 3.1 | 424.0 | 433.5 | 25.91 ± 0.26 |
| `elixir Erlang/elixir.ex` | 574.3 ± 7.2 | 569.0 | 590.0 | 34.82 ± 0.50 |
| `coffee JavaScript/CoffeeScript.coffee` | 582.1 ± 4.3 | 577.2 | 588.8 | 35.29 ± 0.36 |
| `psql -d 7SegmentDisplays -qtAX -f SQL/PostgreSQL.sql` | 665.8 ± 3.0 | 661.0 | 670.7 | 40.36 ± 0.33 |
| `sqlite3 /tmp/7SegmentDisplays.db <SQL/SQLite.sql` | 673.8 ± 2.5 | 671.3 | 678.6 | 40.85 ± 0.32 |
| `scala -cp Java Scala7SegmentDisplays` | 707.9 ± 9.6 | 698.6 | 724.8 | 42.92 ± 0.65 |
| `Rscript --vanilla R/R.r` | 904.8 ± 5.0 | 898.2 | 910.6 | 54.86 ± 0.48 |
| `groovy Java/Groovy.groovy 2>/dev/null` | 967.8 ± 22.7 | 944.3 | 1007.3 | 58.68 ± 1.43 |
| `deno run -q --allow-read --no-config --no-lock JavaScript/TypeScript.ts` | 979.7 ± 11.4 | 966.0 | 995.9 | 59.40 ± 0.81 |
| `mysql 7SegmentDisplays -Ns <SQL/MySQL.sql` | 1727.7 ± 7.0 | 1714.7 | 1737.6 | 104.75 ± 0.83 |
| `zsh -f Shell/Zsh.sh` | 3042.2 ± 21.3 | 3009.1 | 3076.8 | 184.44 ± 1.81 |
| `bash --noprofile --norc Shell/Bash.sh` | 5232.0 ± 68.0 | 5133.8 | 5355.9 | 317.20 ± 4.66 |
| `perl6 Perl/Perl6.p6` | 5760.9 ± 172.1 | 5574.6 | 6016.3 | 349.27 ± 10.71 |
| `octave -f Octave/Octave.m 2>/dev/null` | 7498.6 ± 12.7 | 7478.1 | 7512.3 | 454.62 ± 3.22 |
| `cmake -P CMake/CMake.cmake 2>&1` | 8669.6 ± 87.7 | 8586.5 | 8840.4 | 525.61 ± 6.43 |
