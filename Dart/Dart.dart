import 'dart:io';

main() async {
    var longest = List();
    var invalid = RegExp(r'[gkmqvwxio]', caseSensitive: false);
    var maxlen = 0;

    (await File('words.txt').readAsLines()).forEach((word) {
        if(word.length == maxlen && !invalid.hasMatch(word)) {
            longest.add(word);
        } else if(word.length > maxlen && !invalid.hasMatch(word)) {
            longest.clear();
            longest.add(word);
            maxlen = word.length;
        }
    });

    print(longest.join('\n'));
}

