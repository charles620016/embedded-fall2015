#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <assert.h>

#include IMPL

#define DICT_FILE "./dictionary/words.txt"
#define INPUT_SIZE 17

static double diff_in_second(struct timespec t1, struct timespec t2)
{
    struct timespec diff;
    if (t2.tv_nsec - t1.tv_nsec < 0) {
        diff.tv_sec  = t2.tv_sec - t1.tv_sec - 1;
        diff.tv_nsec = t2.tv_nsec - t1.tv_nsec + 1000000000;
    } else {
        diff.tv_sec  = t2.tv_sec - t1.tv_sec;
        diff.tv_nsec = t2.tv_nsec - t1.tv_nsec;
    }
    return (diff.tv_sec + diff.tv_nsec / 1000000000.0);
}

int main(int argc, char *argv[])
{
    FILE *fp;
    int i = 0;
    char line[MAX_LAST_NAME_SIZE];
    struct timespec start, end;
    double cpu_time1, cpu_time2;

    /* check file opening */
    fp = fopen(DICT_FILE, "r");
    if (fp == NULL) {
        printf("cannot open the file\n");
        return -1;
    }

    /* build the entry */
    entry *pHead, *e;
    pHead = (entry *) malloc(sizeof(entry));
    printf("size of entry : %lu bytes\n", sizeof(entry));
    e = pHead;
    e->pNext = NULL;

#if defined(__GNUC__)
    __builtin___clear_cache((char *) pHead, (char *) pHead + sizeof(entry));
#endif

    /* Original version
     * OR
     * First optimal version (use smaller entry struct)
     */
#if defined(ORIG) || defined(OPT1)
    clock_gettime(CLOCK_REALTIME, &start);
    while (fgets(line, sizeof(line), fp)) {
        while (line[i] != '\0')
            i++;
        line[i - 1] = '\0';
        i = 0;
        e = append(line, e);
    }
    clock_gettime(CLOCK_REALTIME, &end);
    cpu_time1 = diff_in_second(start, end);
#endif

    /* Second optimal version (use smaller entry
     * struct and then couple with a hash table)
     */
#if defined(OPT2)
    int tableSize = 42737;
    hashTable *ht = createHashTable(tableSize);

    clock_gettime(CLOCK_REALTIME, &start);
    while (fgets(line, sizeof(line), fp)) {
        while (line[i] != '\0')
            i++;
        line[i - 1] = '\0';
        i = 0;
        append(line, ht);
    }
    clock_gettime(CLOCK_REALTIME, &end);
    cpu_time1 = diff_in_second(start, end);
#endif
    /* close file as soon as possible */
    fclose(fp);

    /* the given last name */
    char input[INPUT_SIZE][MAX_LAST_NAME_SIZE] = {"apasco", "astatically",
                                                  "conns", "crevette",
                                                  "fashionable", "floscular",
                                                  "herodians", "hudkins",
                                                  "mitogenetic", "muishond",
                                                  "shaftoe", "siva",
                                                  "turandot", "underfed",
                                                  "virginally", "werugha",
                                                  "xeromyron"
                                                 };
    /* rewind the entry e to begining of list*/
    e = pHead;

#if defined(__GNUC__)
    __builtin___clear_cache((char *) pHead, (char *) pHead + sizeof(entry));
#endif

    /* check the program before computing the execution time*/
#if defined(ORIG) || defined(OPT1)
    for (int j = 0; j < INPUT_SIZE; j++) {
        assert(findName(input[j], e) != NULL &&
               "last name not found!");
        e = pHead;
    }
#endif
#if defined(OPT2)
    for (int j = 0; j < INPUT_SIZE; j++) {
        assert(findName(input[j], ht) != NULL &&
               "last name not found!");
    }
#endif

    /* compute the execution time */
    clock_gettime(CLOCK_REALTIME, &start);
#if defined(ORIG) || defined(OPT1)
    for (int j = 0; j < INPUT_SIZE; j++) {
        findName(input[j], e);
        e = pHead;
    }
#endif

#if defined(OPT2)
    for (int j = 0; j < INPUT_SIZE; j++) {
        findName(input[j], ht);
    }
#endif
    clock_gettime(CLOCK_REALTIME, &end);
    cpu_time2 = diff_in_second(start, end);


    /* write result into the file */
    FILE *output;
#if defined(ORIG)
    output = fopen("orig.txt", "a");
#elif defined(OPT1)
    output = fopen("opt1.txt", "a");
#elif defined(OPT2)
    output = fopen("opt2.txt", "a");
#endif
    fprintf(output, "%lf %lf\n", cpu_time1, cpu_time2);
    fclose(output);

    printf("execution time of append() : %lf sec\n", cpu_time1);
    printf("execution time of findName() : %lf sec\n", cpu_time2);

    /* release all allocated entries */
    free(pHead);
#if defined(OPT2)
    freeHashTable(ht);
#endif

    return 0;
}
