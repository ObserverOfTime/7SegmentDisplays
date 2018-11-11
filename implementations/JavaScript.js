const words = require('fs').readFileSync('words.txt', 'utf-8');
const invalid = (s) => /[gkmqvwxzio]/.test(s);
let longest = [], len = 0;

for(const word of words.split('\n')) {
    len = (longest[0] || '').length;
    if(word.length === len) {
        if(!invalid(word)) longest.push(word);
    } else if(word.length > len) {
        if(!invalid(word)) longest = [word];
    }
}

console.log(longest.join('\n'));

