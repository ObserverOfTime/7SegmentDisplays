CREATE TEMPORARY TABLE words ( word TEXT );
LOAD DATA LOCAL INFILE 'words.txt' INTO TABLE words;
SELECT MAX(LENGTH(word)) INTO @maxlen FROM words
WHERE word NOT RLIKE '[gkmqvwxzio]';

SELECT word FROM words
WHERE word NOT RLIKE '[gkmqvwxzio]'
AND LENGTH(word) = @maxlen;
