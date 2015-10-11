#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "phonebook_opt2.h"

entry *findName(char *key, hashTable *ht)
{
    entry *e;
    hashIndex index = hash2(key, ht);
    /* search the bucket */
    for (e = ht->list[index]; e != NULL; e = e->pNext) {
        if (strcasecmp(key, e->lastName) == 0) {
            return e;
        }
    }
    return NULL;
}

int append(char *key, hashTable *ht)
{
    hashIndex index = hash2(key, ht);
    entry *newEntry;
    // entry *currentEntry;

    /* Does entry already exist? If it does, don't append it again.
    if( (currentEntry = findNameHash(key, ht)) != NULL ){
        return 1;
    }*/

    /* attempt to allocate memory for entry */
    if ((newEntry = (entry *) malloc(sizeof(entry))) == NULL) {
        return 2;
    }

    /* Insert into list */
    strcpy(newEntry->lastName, key);
    newEntry->pNext = ht->list[index];
    ht->list[index] = newEntry;
    return 0;
}

hashTable *createHashTable(int tableSize)
{
    hashTable *ht = NULL;

    if (tableSize < 1) {
        return NULL;
    }

    /* Allocate the table itself. */
    if ((ht = (hashTable *) malloc(sizeof(hashTable))) == NULL) {
        return NULL;
    }

    /* Allocate array of list. */
    if ((ht->list = (entry **)malloc(sizeof(entry *)*tableSize)) == NULL) {
        return NULL;
    }

    ht->tableSize = tableSize;
    return ht;
}

void freeHashTable(hashTable *ht)
{
    int i = 0;
    for (i = 0; i < ht->tableSize; i++) {
        entry *cur;
        if ((cur = ht->list[i])) {
            do {
                entry *e = cur;
                cur = e->pNext;
                free(e);
            } while (cur);
        }
    }
    free(ht->list);
    free(ht);
}

hashIndex hash1(char *key, hashTable *ht)
{
    unsigned int hashVal = 0;

    while (*key != '\0') {
        hashVal += *key++;
    }

    return hashVal % ht->tableSize;
}

hashIndex hash2(char *key, hashTable *ht)
{
    unsigned int hashVal = 0;

    while (*key != '\0') {
        hashVal = (hashVal << 5) + *key++;
    }

    return hashVal % ht->tableSize;
}