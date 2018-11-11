#include <iostream>
#include <fstream>
#include <regex>

int main() {
    std::vector<std::string> words;
    std::vector<std::string> longest;
    std::regex invalid(".*[gkmqvwxzio].*");
    std::ifstream words_txt("words.txt");
    std::string line;
    while(!words_txt.eof()) {
        getline(words_txt, line);
        words.push_back(line);
    }
    words_txt.close();

    long unsigned int len = 0;
    for(const auto &word : words) {
        len = longest.empty() ? 0 : longest.front().length();
        if(word.length() == len) {
            if(!regex_match(word, invalid)) {
                longest.push_back(word);
            }
        } else if(word.length() > len) {
            if(!regex_match(word, invalid)) {
                longest.clear();
                longest.push_back(word);
            }
        }
    }

    for(const auto &l : longest) std::cout << l << std::endl;
    return 0;
}

