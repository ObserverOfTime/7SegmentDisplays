# C++
CPP = g++
CPPFLAGS = -Ofast

# C#
CSC = mcs
CSCFLAGS = -o+

# D
DC = dmd
DCFLAGS = -O -release -inline

# Go
GO = go
GOFLAGS =

# Java
JAVAC = javac
JAVACFLAGS =

# Kotlin
KOTLINC = kotlinc
KOTLINCFLAGS =

# Pascal & Delphi
FPC = fpc
PASCALFLAGS = -O3
DELPHIFLAGS = $(PASCALFLAGS)

# Scala
SCALAC = scalac
SCALAFLAGS =

benchmarks = \
	'./C/C++.out' \
	'./D/D.out' \
	'./Go/Go.out' \
	'./Pascal/Delphi.out' \
	'./Pascal/Pascal.out' \
	'awk -f Awk/Awk.awk' \
	'bash Shell/Bash.sh' \
	'cmake -P CMake/CMake.cmake' \
	'coffee JavaScript/CoffeeScript.coffee' \
	'gawk -f Awk/Gawk.awk' \
	'groovy Groovy/Groovy.groovy 2>/dev/null' \
	'java -cp Java Java7SegmentDisplays' \
	'kotlin -cp Kotlin KotlinKt' \
	'lsc JavaScript/LiveScript.ls' \
	'mono C/C\#.out' \
	'mysql words -Nsu 7SegmentDisplays <SQL/MySQL.sql' \
	'node JavaScript/JavaScript.js' \
	'nvim -u NONE --noplugin --headless +"so VimL/VimL.vim|q"' \
	'python2 Python/Python2.py' \
	'python3 Python/Python3.py' \
	'Rscript R/R.r' \
	'scala -cp Scala Scala7SegmentDisplays' \
	'sqlite3 /tmp/7SegmentDisplays.db <SQL/SQLite.sql' \
	'ts-node JavaScript/TypeScript.ts' \
	'zsh Shell/Zsh.sh'

.PHONY: all bench clean distclean help

## Compile all languages
all: cpp cs d delphi go java kotlin pascal scala

cpp: C/C++.cpp; $(CPP) $(CPPFLAGS) $< -o $(<:.cpp=.out)

cs: C/C\#.cs; $(CSC) $(CSCFLAGS) $< -out:$(<:.cs=.out)

d: D/D.d; $(DC) $(DCFLAGS) $< -of=$(<:.d=.out)

delphi: Pascal/Delphi.pas; $(FPC) $(DELPHIFLAGS) $< -o$(<:.pas=.out)

go: Go/Go.go; $(GO) build $(GOFLAGS) -o $(<:.go=.out) $<

java: Java/Java.java; $(JAVAC) $(JAVACFLAGS) -d Java $<

kotlin: Kotlin/Kotlin.kt; $(KOTLINC) $(KOTLINCFLAGS) -d Kotlin $<

pascal: Pascal/Pascal.pas; $(FPC) $(PASCALFLAGS) $< -o$(<:.pas=.out)

scala: Scala/Scala.scala; $(SCALAC) $(SCALACFLAGS) -d Scala $<

## Run benchmarks with hyperfine
bench:
	hyperfine -w 2 -r 5 $(benchmarks) --export-markdown BENCHMARKS.md

## Remove object files
clean:
	find -name '*.o' -exec -rm -v {} +

## Remove all generated files
distclean:
	find -regex '.*\.\(o\(ut\)?\|class\)' -exec rm -v {} +

## List all languages in markdown format
langs:
	@find * -mindepth 1 -type f -name '[A-Z]*.*' | \
		awk -F[/.]  '{print "* ["$$2"]("$$0")"}' | sort

## Show this help message
help:
	@awk '/^##/{help=substr($$0, 3); getline; print $$1help}' $(MAKEFILE_LIST)

