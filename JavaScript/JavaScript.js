const invalid = (s) => /[gkmqvwxzio]/.test(s);
let longest = [], maxlen = 0;
require('fs').createReadStream('words.txt')
    .on('data', (data) => {
        for(const word of data.toString().split('\n')) {
            if(word.length === maxlen) {
                if(!invalid(word)) longest.push(word);
            } else if(word.length > maxlen) {
                if(!invalid(word)) longest = [word];
            }
            maxlen = (longest[0] || '').length;
        }
    }).on('close', () => {
        console.log(longest.join('\n'));
    });

