using System.IO;
using System.Collections.Generic;
using System.Text.RegularExpressions;

class CS7SegmentDisplays {
    static void Main(string[] args) {
        var invalid = new Regex("(?i)[gkmqvwxzio]");
        var longest = new List<string>();
        var maxlen = 0;

        foreach (var word in File.ReadLines("words.txt")) {
            var wlen = word.Length;
            if (wlen == maxlen && !invalid.Match(word).Success) {
                longest.Add(word);
            } else if (wlen > maxlen && !invalid.Match(word).Success) {
                longest.Clear();
                longest.Add(word);
                maxlen = wlen;
            }
        }

        longest.ForEach(System.Console.WriteLine);
    }
}
