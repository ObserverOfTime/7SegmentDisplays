const words: string = require('fs').readFileSync('words.txt', 'utf-8');
const invalid = (s: string) => /[gkmqvwxzio]/.test(s);
let longest: string[] = [], len: number = 0;

for(const word of words.split('\n')) {
    len = (longest[0] || '').length;
    if(word.length === len) {
        if(!invalid(word)) longest.push(word);
    } else if(word.length > len) {
        if(!invalid(word)) longest = [word];
    }
}

console.log(longest.join('\n'));

