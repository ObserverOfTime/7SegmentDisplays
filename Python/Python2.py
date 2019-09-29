import re

invalid = re.compile('[gkmqvwxzio]', re.I)
longest = []
maxlen = 0

with open('words.txt', 'r') as words:
    for word in words.read().splitlines():
        if len(word) == maxlen and not invalid.search(word):
            longest.append(word)
        if len(word) > maxlen and not invalid.search(word):
            longest = [word]
            maxlen = len(word)

print '\n'.join(longest)
