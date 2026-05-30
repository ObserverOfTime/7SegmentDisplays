import { TextLineStream } from "jsr:@std/streams";

const invalid = /[gkmqvwxzio]/i;
let longest: string[] = [];
let maxlen = 0;

const words = (await Deno.open("words.txt")).readable
    .pipeThrough(new TextDecoderStream()).pipeThrough(new TextLineStream());

for await (const word of words) {
  if (word.length === maxlen && !invalid.test(word)) {
    longest.push(word);
  } else if (word.length > maxlen && !invalid.test(word)) {
    longest = [word];
    maxlen = word.length;
  }
}

console.log(longest.join('\n'));
