using System.IO;
using System.Collections.Generic;
using System.Text.RegularExpressions;

class CS7SegmentDisplays {
    static void Main(string[] args) {
        Regex invalid = new Regex("(?i)[gkmqvwxzio]");
        List<string> longest = new List<string>();
        int maxlen = 0;

        foreach(string word in File.ReadLines("words.txt")) {
            int wlen = word.Length;
            if(wlen == maxlen && !invalid.Match(word).Success) {
                longest.Add(word);
            } else if(wlen > maxlen && !invalid.Match(word).Success) {
                longest.Clear();
                longest.Add(word);
                maxlen = wlen;
            }
        }

        longest.ForEach(System.Console.WriteLine);
    }
}

