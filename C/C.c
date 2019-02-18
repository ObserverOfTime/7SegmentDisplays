#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define VALID_WORD regexec(&invalid, word, 0, NULL, 0) == REG_NOMATCH

int main() {
    char *word, **tmp, **words = NULL;
    FILE *txt = fopen("words.txt", "r");
    size_t maxlen = 0, wlen = 0;
    int num = 0;
    regex_t invalid;
    regcomp(&invalid, ".*[gkmqvwxzio].*", REG_ICASE|REG_NOSUB);
    while(getline(&word, &wlen, txt) != -1) {
        wlen = strlen(word);
        if(wlen == maxlen && VALID_WORD) {
            tmp = words;
            words = (char **) realloc(tmp, wlen * ++num);
            *(words + num - 1) = (char *) malloc(wlen);
            strncpy(*(words + num - 1), word, wlen);
        } else if(wlen > maxlen && VALID_WORD) {
            words = (char **) realloc(words, wlen);
            *words = (char *) malloc(wlen);
            strncpy(*words, word, wlen);
            maxlen = wlen;
            num = 1;
        }
    }
    fclose(txt);
    free(word);
    regfree(&invalid);
    for(int i = 0; i < num; ++i) printf("%s", *(words + i));
    free(words);
    return 0;
}

