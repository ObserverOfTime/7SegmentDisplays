invalid = lambda w: any(c in w.lower() for c in 'gkmqvwxzio')
longest = ''
maxlen = 0

with open('words.txt', 'r') as words:
    for word in words.readlines():
        if len(word) == maxlen and not invalid(word):
            longest += word
        if len(word) > maxlen and not invalid(word):
            longest = word
            maxlen = len(word)

print(longest, end='')
