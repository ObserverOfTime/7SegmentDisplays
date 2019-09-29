import std.stdio, std.container, std.conv, std.regex;

void main() {
    auto invalid = regex(r"(?i)[gkmqvwxzio]");
    auto longest = Array!string();
    int maxlen = 0;

    foreach(ref line; File("words.txt").byLine()) {
        string word = to!string(line);
        int wlen = to!int(word.length);
        if(wlen == maxlen && !word.matchAll(invalid)) {
            longest.insertBack(word);
        } else if(wlen > maxlen && !word.matchAll(invalid)) {
            longest.clear();
            longest.insertBack(word);
            maxlen = wlen;
        }
    }

    foreach(l; longest) writeln(l);
}
