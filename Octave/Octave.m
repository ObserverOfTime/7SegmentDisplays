longest = [];
maxlen = 0;
invalid = @(s) regexpi(s, "[gkmqvwxzio]", "once");

words = fopen('words.txt','r');
while ~feof(words), word = fgetl(words);
    wlen = length(word);
    if (wlen == maxlen && ~length(invalid(word)))
        longest = [longest; word];
    elseif (wlen > maxlen && ~length(invalid(word)))
        longest = [word];
        maxlen = wlen;
    endif
endwhile
fclose(words);

disp(longest)
