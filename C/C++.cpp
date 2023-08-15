#include <fstream>
#include <iostream>
#include <regex>

int main() {
    std::vector<std::string> longest;
    std::regex invalid(".*[gkmqvwxzio].*", std::regex_constants::icase);
    std::ifstream words("words.txt");
    std::string word;
    unsigned long wlen = 0, maxlen = 0;

    while (!words.eof()) {
        getline(words, word);
        wlen = word.length();
        if (wlen == maxlen && !regex_match(word, invalid)) {
            longest.push_back(word);
        } else if (wlen > maxlen && !regex_match(word, invalid)) {
            longest.clear();
            longest.push_back(word);
            maxlen = wlen;
        }
    }
    words.close();

    for (const auto &l : longest) std::cout << l << std::endl;
}
