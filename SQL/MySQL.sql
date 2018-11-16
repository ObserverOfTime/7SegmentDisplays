CREATE TEMPORARY TABLE words ( `word` TEXT );
LOAD DATA LOCAL INFILE 'words.txt' INTO TABLE words;
SELECT MAX(LENGTH(word)) INTO @maxlen FROM words
WHERE word NOT REGEXP '[gkmqvwxzio]';

SELECT word FROM words
WHERE word NOT REGEXP '[gkmqvwxzio]'
AND LENGTH(word) = @maxlen;

