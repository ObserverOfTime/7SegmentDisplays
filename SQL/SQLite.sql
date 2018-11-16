CREATE TEMP TABLE words ( word VARCHAR );
.import words.txt words

SELECT word FROM words
WHERE word NOT GLOB '*[gkmqvwxzio]*'
AND LENGTH(word) = (
    SELECT MAX(LENGTH(word)) FROM words
    WHERE word NOT GLOB '*[gkmqvwxzio]*'
);

