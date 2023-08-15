CREATE TEMPORARY TABLE words ( word TEXT );
\copy words FROM 'words.txt'

SELECT word FROM words
WHERE word !~* '[gkmqvwxzio]'
AND LENGTH(word) = (
    SELECT MAX(LENGTH(word)) FROM words
    WHERE word !~* '[gkmqvwxzio]'
);
