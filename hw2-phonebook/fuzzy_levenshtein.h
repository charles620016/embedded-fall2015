#ifndef _FUZZY_LEVENSHTEIN_H
#define _FUZZY_LEVENSHTEIN_H

#define MAX_LAST_NAME_SIZE 16

typedef struct __DETAIL_ENTRY {
    char firstName[16];
    char email[16];
    char phone[10];
    char cell[10];
    char addr1[16];
    char addr2[16];
    char city[16];
    char state[2];
    char zip[5];
    struct __DETAIL_ENTRY *pNext;
} detail_entry;

typedef struct __ENTRY {
    char lastName[MAX_LAST_NAME_SIZE];
    detail_entry *detail;
    struct __ENTRY *pNext;
} entry;

/* Compute Levenshtein distance using given string a, b 
 * and corresponding length
 */
int lev_dist_recursive(char *a, int len_a, char *b, int len_b);
int lev_dist_iteration(char *a, int len_a, char *b, int len_b);

entry *append(char lastName[], entry *lne);
entry *search_list(char lastName[], entry *pHead, int dist_range);

#endif