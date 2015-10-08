#ifndef _FUZZYSEARCH_H
#define _FUZZYSEARCH_H

#define MAX_LAST_NAME_SIZE 16

typedef struct __PHONE_BOOK_ENTRY {
    char firstName[16];
    char email[16];
    char phone[10];
    char cell[10];
    char addr1[16];
    char addr2[16];
    char city[16];
    char state[2];
    char zip[5];
    struct __PHONE_BOOK_ENTRY *pNext;
} detailEntry;


/* optimal version 1 : smaller struct */
typedef struct __LAST_NAME_ENTRY {
    char lastName[MAX_LAST_NAME_SIZE];
    detailEntry *detail;
    struct __LAST_NAME_ENTRY *pNext;
} entry;

entry *findName(char lastName[], entry *pHead, int similarity);
entry *append(char lastName[], entry *lne);

int minimum(int x, int y, int z);
int lev_dist_recursive(char *a, int len_a, char *b, int len_b);
int lev_dist_iteration(char *a, int len_a, char *b, int len_b);

#endif