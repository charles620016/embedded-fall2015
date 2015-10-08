#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "fuzzysearch.h"

int minimum(int x, int y, int z)
{
    x = x < y ? x : y;
    return x < z ? x : z;
}

int lev_dist_recursive(char *a, int len_a, char *b, int len_b)
{
    int cost;

    /* base case: empty strings */
    if (len_a == 0) return len_b;
    if (len_b == 0) return len_a;

    /* test if last characters of the strings match */
    if (a[len_a - 1] == b[len_b - 1])
        cost = 0;
    else
        cost = 1;

    return minimum(lev_dist_recursive(a, len_a - 1, b, len_b) + 1,         // deletion
                   lev_dist_recursive(a, len_a, b, len_b - 1) + 1,         // insertion
                   lev_dist_recursive(a, len_a - 1, b, len_b - 1) + cost); // substitution
}

int lev_dist_iteration(char a[], int len_a, char b[], int len_b)
{
    /* for all i and j, dist[i,j] will hold the Levenshtein distance between
     * the first i characters of a and the first j characters of b;
     */
    int dist[MAX_LAST_NAME_SIZE + 1][MAX_LAST_NAME_SIZE + 1] = {{0}};
    int i, j, tmp;

    /* source prefixes can be transformed into empty string by
     * dropping all characters
     */
    for (i = 0; i <= len_b; i++)
        dist[0][i] = i;

    /* target prefixes can be reached from empty source prefix
     * by inserting every character
     */
    for (j = 0; j <= len_a; j++)
        dist[j][0] = j;

    for (j = 1; j <= len_b; j++) {
        for (i = 1; i <= len_a; i++) {
            tmp = (a[i - 1] == b[j - 1]) ? 0 : 1;
            dist[i][j] = minimum(dist[i - 1][j] + 1,      // deletion
                                 dist[i][j - 1] + 1,      // insertion
                                 dist[i - 1][j - 1] + tmp // substitution
                                );
        }
    }

    return dist[len_a][len_b];
}

entry *findName(char lastName[], entry *pHead, int similarity)
{
    while (pHead != NULL) {
        int dist = lev_dist_iteration(lastName, strlen(lastName), pHead->lastName,
                                      strlen(pHead->lastName));
        if (dist <= similarity) {
            printf("dist = %d, %s\n", dist, pHead->lastName);
        }
        pHead = pHead->pNext;
    }
    return NULL;
}

entry *append(char lastName[], entry *e)
{
    /* allocate memory for the new entry and put lastName in it.*/
    e->pNext = (entry *) malloc(sizeof(entry));
    e = e->pNext;
    strcpy(e->lastName, lastName);
    e->pNext = NULL;
    return e;
}

