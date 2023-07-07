import { readLines } from 'https://deno.land/std@0.193.0/io/mod.ts';

const invalid = (s: string) => /[gkmqvwxzio]/i.test(s);
let longest: string[] = [], maxlen: number = 0;

for await (const word of readLines(await Deno.open('words.txt'))) {
    if (word.length === maxlen && !invalid(word)) {
        longest.push(word);
    } else if (word.length > maxlen && !invalid(word)) {
        longest = [word];
        maxlen = word.length;
    }
}

console.log(longest.join('\n'));
