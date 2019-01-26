const words = require('fs').readFileSync('words.txt');
const invalid = (s) => (/[gkmqvwxzio]/i).test(s);
let longest = [], maxlen = 0;

for(const word of words.toString().split('\n')) {
    if(word.length === maxlen && !invalid(word)) {
        longest.push(word);
    } else if(word.length > maxlen && !invalid(word)) {
        longest = [word];
        maxlen = word.length;
    }
}

console.log(longest.join('\n'));

