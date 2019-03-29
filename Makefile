# C
CC = gcc
CFLAGS = -std=c99 -Ofast

# C++
CPP = g++
CPPFLAGS = -std=c++11 -Ofast

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

# Nim
NIM = nim
NIMFLAGS = -d:release --nimcache:$(HOME)/.cache/nimcache

# Pascal & Delphi
FPC = fpc
PASCALFLAGS = -O3
DELPHIFLAGS = $(PASCALFLAGS)

# Rust
RUSTC = rustc
RUSTFLAGS = -O

# Scala
SCALAC = scalac
SCALAFLAGS =

benchmarks = BENCHMARKS.md
commands = $(shell awk -F[:,] '{printf $$2" "}' t/tests.json)

## Compile all languages
all: c cpp cs d delphi go java kotlin nim pascal rust scala

c: C/C.c; $(CC) -D_POSIX_C_SOURCE=200809L $(CFLAGS) $< -o $(<:.c=.out)

cpp: C/C++.cpp; $(CPP) $(CPPFLAGS) $< -o $(<:.cpp=.out)

cs: C/C\#.cs; $(CSC) $(CSCFLAGS) $< -out:$(<:.cs=.out)

d: D/D.d; $(DC) $(DCFLAGS) $< -of=$(<:.d=.out)

delphi: Pascal/Delphi.pas; $(FPC) $(DELPHIFLAGS) $< -o$(<:.pas=.out)

go: Go/Go.go; $(GO) build $(GOFLAGS) -o $(<:.go=.out) $<

java: Java/Java.java; $(JAVAC) $(JAVACFLAGS) -d Java $<

kotlin: Kotlin/Kotlin.kt; $(KOTLINC) $(KOTLINCFLAGS) -d Kotlin $<

nim: Nim/Nim.nim; $(NIM) compile $(NIMFLAGS) -o:$(<:.nim=.out) $<

pascal: Pascal/Pascal.pas; $(FPC) $(PASCALFLAGS) $< -o$(<:.pas=.out)

rust: Rust/rust.rs; $(RUSTC) $(RUSTFLAGS) -o Rust $<

scala: Scala/Scala.scala; $(SCALAC) $(SCALACFLAGS) -d Scala $<

## Run language tests
test: t/tests.t; prove --trap -v $< $(if $(TESTS),:: $(TESTS),)

## Run benchmarks with hyperfine
bench:
	hyperfine -w 2 -r 5 $(commands) --export-markdown $(benchmarks)
	@gawk -iinplace 'NR<3;NR>2{print|"sort -n -k3 -t\\|"}' $(benchmarks)

## Remove object files
clean: ; find -name '*.o' -exec rm -v {} +

## Remove all generated files
cleanall: ; find -regex '.*\.\(o\(ut\)?\|class\)' -exec rm -v {} +

## List all languages in markdown format
langs:
	@find * -mindepth 1 -type f -name '[A-Z]*.*' -not \
		-regex '.*\.\(\o\(ut\)?\|class\)' -not -path \
		'*node_modules*' -not -path '*nimcache*' | \
		awk -F[/.] '{print "* ["$$2"]("$$0")"}' | sort

## Show this help message
help:
	@awk '/^##/{help=substr($$0, 3); getline; \
		print $$1help}' $(lastword $(MAKEFILE_LIST))

