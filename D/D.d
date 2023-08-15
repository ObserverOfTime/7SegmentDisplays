import std.stdio, std.container, std.conv, std.regex;

void main() {
    auto invalid = regex(r"(?i)[gkmqvwxzio]");
    auto longest = Array!string();
    auto maxlen = 0;

    foreach (ref line; File("words.txt").byLine()) {
        auto word = to!string(line);
        auto wlen = to!int(word.length);
        if (wlen == maxlen && !word.matchAll(invalid)) {
            longest.insertBack(word);
        } else if (wlen > maxlen && !word.matchAll(invalid)) {
            longest.clear();
            longest.insertBack(word);
            maxlen = wlen;
        }
    }

    foreach (l; longest) writeln(l);
}
