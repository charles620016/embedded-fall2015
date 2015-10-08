#include <stdio.h>
#include <string.h>

#define DICT_FILE "./dictionary/words.txt"

int main(int argc, char const *argv[])
{
    FILE *fp;
    char line[16];
    int i = 0;
    fp = fopen(DICT_FILE, "r");
    if (fp == NULL) {
        printf("cannot open the file\n");
        return -1;
    }
    int count = 0;
    int total = 0;

    while (fgets(line, sizeof(line), fp)) {
        while (line[i] != '\0')
            i++;
        line[i - 1] = '\0';
        i = 0;
        if ((count % 5000) == 0) {
            printf("%s,", line);
            total++;
        }
        count++;
    }
    printf("\n%d\n", total);

    return 0;
}
