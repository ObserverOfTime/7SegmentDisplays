from __future__ import print_function
from re import search

invalid = lambda s: search('[gkmqvwxzio]', s)
longest = []

with open('words.txt', 'r') as words:
    for word in words.read().splitlines():
        _len = len(longest[0]) if len(longest) else 0
        if len(word) == _len and not invalid(word):
            longest.append(word)
        if len(word) > _len and not invalid(word):
            longest = [word]

print('\n'.join(longest))

