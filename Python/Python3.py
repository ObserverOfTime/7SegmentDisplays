#!/usr/bin/env python3

from re import search

invalid = lambda s: search('(?i)[gkmqvwxzio]', s)
longest = []
maxlen = 0

with open('words.txt', 'r') as words:
    for word in words.read().splitlines():
        if len(word) == maxlen and not invalid(word):
            longest.append(word)
        if len(word) > maxlen and not invalid(word):
            longest = [word]
            maxlen = len(word)

print('\n'.join(longest))

