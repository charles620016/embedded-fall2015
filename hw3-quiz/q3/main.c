#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include "binary_tree.h"

#define INPUT_SIZE 1000000
#define MODULE_NUMBER 2097593

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

int main(int argc, char const *argv[])
{
    /* create a binary search tree */
    tree_node *root = NULL;
    srand(time(NULL));
    root = insert(root, rand() % MODULE_NUMBER);
    for (int i = 1; i < INPUT_SIZE; i++) {
        insert(root, rand() % MODULE_NUMBER);
    }

    /* compute execution time */
    struct timespec start, end;
    double cpu_time;
    clock_gettime(CLOCK_REALTIME, &start);
    flatten(root);
    clock_gettime(CLOCK_REALTIME, &end);
    cpu_time = diff_in_second(start, end);

    /* write result */
    FILE *fp;
    fp = fopen("time.dat", "a");
    assert(fp);

    fprintf(fp, "method\ttime\n");
#if defined(ITERATIVE)
    fprintf(fp, "iterative\t%.9lf\n", cpu_time);
#endif

#if defined(RECURSIVE)
    fprintf(fp, "recursive\t%.9lf\n", cpu_time);
#endif
    fclose(fp);

    printf("execution time : %lf sec\n", cpu_time);
    return 0;
}