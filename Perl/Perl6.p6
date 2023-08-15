my $maxlen = 0;
my @longest;

for 'words.txt'.IO.lines {
    next if m:i/<[gkmqvwxzio]>/;
    my $wlen = chars($_);
    if $wlen == $maxlen {
        @longest.push: $_;
    } elsif $wlen > $maxlen {
        @longest = ($_);
        $maxlen = $wlen;
    }
}

.say for @longest;
