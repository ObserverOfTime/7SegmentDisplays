#!/usr/bin/env perl

use experimental 'for_list';
use JSON::Parse 'json_file_to_perl';
use Test::More;

my $tests = json_file_to_perl 't/tests.json';

my $expected = <<'EOF';
supertranscendentness
three-and-a-halfpenny
EOF

plan tests => @ARGV ? $#ARGV + 1 : scalar keys %$tests;

foreach my($lang, $cmd) (%$tests) {
    # If arguments are passed, run only the
    # tests for the languages listed in them
    @ARGV && next unless grep m/^\Q$lang\E$/i, @ARGV;
    is `$cmd`, $expected, "$lang: $cmd";
}
