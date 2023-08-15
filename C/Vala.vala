int main() {
    var longest = new Array<string>();
    var invalid = new Regex("[gkmqvwxzio]", RegexCompileFlags.CASELESS);
    var words = FileStream.open("words.txt", "r");
    string word;
    ulong wlen = 0, maxlen = 0;

    while ((word = words.read_line()) != null) {
        wlen = word.length;
        if (wlen == maxlen && !invalid.match(word)) {
            longest.append_val(word);
        } else if (wlen > maxlen && !invalid.match(word)) {
            longest.set_size(0);
            longest.append_val(word);
            maxlen = wlen;
        }
    }

    for (int i = 0; i < longest.length; ++i)
        stdout.printf("%s\n", longest.index(i));
    return 0;
}
