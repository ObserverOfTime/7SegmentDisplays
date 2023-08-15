# C
CC = gcc
CFLAGS = -std=c99 -Ofast -march=native -D_POSIX_C_SOURCE=200809L

# C++
CPP = g++
CPPFLAGS = -std=c++11 -Ofast -march=native

# C#
CSC = mcs
CSCFLAGS = -o+ -platform:x64

# Crystal
CRYSTAL = crystal build
CRYSTALFLAGS = --release

# D
DC = dmd
DCFLAGS = -O -release -mcpu=native

# Dart
DART = dart compile exe
DARTFLAGS =

# Go
GO = go build
GOFLAGS = GOOS=linux GOARCH=amd64

# Java
JAVAC = javac
JAVACFLAGS = -source 11 -target 11

# Kotlin
KOTLINC = kotlinc
KOTLINCFLAGS = -no-reflect -jvm-target 11

# Nim
NIM = nim compile
NIMFLAGS = -d:release --os:linux --cpu:amd64 \
	--app:console --nimcache:$(HOME)/.cache/nimcache

# Pascal
FPC = fpc
PASCALFLAGS = -Tlinux -Px86_64 -O2

# Rust
RUSTC = rustc
RUSTCFLAGS = -O -C target-cpu=native

# Scala
SCALAC = scalac
SCALACFLAGS = -target:11 -opt:l:method

# Vala
VALAC = valac
VALACFLAGS = -X -Ofast -X -march=native --disable-version-header

benchmarks = BENCHMARKS.md
commands = $(shell awk -F[:,] '{printf $$2" "}' t/tests.json)

## Compile all languages
all: c cpp crystal cs d dart go java kotlin nim pascal rust scala vala

c: C/C.c; $(CC) $(CFLAGS) -o $(<:.c=.out) $<

cpp: C/C++.cpp; $(CPP) $(CPPFLAGS) -o $(<:.cpp=.out) $<

crystal: Crystal/Crystal.cr; $(CRYSTAL) $(CRYSTALFLAGS) -o $(<:.cr=.out) $<

cs: CSharp/C\#.cs; $(CSC) $(CSCFLAGS) -out:$(<:.cs=.out) $<

d: D/D.d; $(DC) $(DCFLAGS) -of=$(<:.d=.out) $<

dart: Dart/Dart.dart; $(DART) $(DARTFLAGS) $< -o $(<:.dart=.out)

go: Go/Go.go; env $(GOFLAGS) $(GO) -o $(<:.go=.out) $<

java: Java/Java.java; $(JAVAC) $(JAVACFLAGS) -d Java $<

kotlin: Java/Kotlin.kt; $(KOTLINC) $(KOTLINCFLAGS) -d Java $<

nim: Nim/Nim.nim; $(NIM) $(NIMFLAGS) -o:$(<:.nim=.out) $<

pascal: Pascal/Pascal.pas; $(FPC) $(PASCALFLAGS) -o$(<:.pas=.out) $<

rust: Rust/rust.rs; $(RUSTC) $(RUSTCFLAGS) -o $(<:.rs=.out) $<

scala: Java/Scala.scala; $(SCALAC) $(SCALACFLAGS) -d Java $<

vala: C/Vala.vala; $(VALAC) $(VALACFLAGS) -o $(<:.vala=.out) $<

## Run language tests
test: t/tests.t; prove --trap -v $< $(if $(LANGS),:: $(LANGS),)

## Run benchmarks with hyperfine
bench:
	hyperfine --style basic -w 3 -r 7 $(commands) --export-markdown $(benchmarks)
	@gawk -iinplace 'NR<3;NR>2{print|"sort -n -k3 -t\\|"}' $(benchmarks)

## Remove all generated files
clean: ; find -regex '.*\.\(o\(ut\)?\|class\|dill\)' -exec rm -v {} +

## List all languages in markdown format
langs:
	@find * -mindepth 1 -type f \
		-not -path '*test*' -not -path '*node_modules*' \
		-not -path '*cache*' -not -path '*META-INF*' \
		-not -regex '.*\.\(o\(ut\)?\|class\|dill\)' \
		| gawk -F[/.] '{print $$2"|* [" \
			toupper(substr($$2, 1, 1)) \
			substr($$2, 2)"]("$$0")"}' \
		| sort -df | cut -d'|' -f2

## Show this help message
help:
	@gawk '/^##/{help=substr($$0, 3); getline; \
		print $$1help}' $(lastword $(MAKEFILE_LIST))
