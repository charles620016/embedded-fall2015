#ifndef _FUZZY_BKTREE_H
#define _FUZZY_BKTREE_H

#include <stdint.h>
#include <stddef.h>
#include "fuzzy_levenshtein.h"

/* Definition of BK-tree node */
typedef struct __BKTREE_NODE{
    struct __ENTRY_IN_NODE {
        char lastName[MAX_LAST_NAME_SIZE];
        detail_entry *detail;
    } entry_in_node;

    struct __BKTREE_NODE *child;
    struct __BKTREE_NODE *sibling;
    uint8_t distance_to_parent;
} bktree_node;

/* Return the address of new node if insert it successfully.
 * Return NULL if there is already an identical node in the bk tree. 
 */
bktree_node *insert_bktree_node(char lastName[], bktree_node *root);

/* Search the bk tree with given last name and distance range.
 * Return the total number of last name found.
 */
size_t *search_bktree(char lastName[], bktree_node *root, int dist_range);

#endif /* _FUZZY_BKTREE_H */

