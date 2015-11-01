#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "fuzzy_levenshtein.h"
#include "fuzzy_bktree.h"

bktree_node *insert_bktree_node(char lastName[], bktree_node *root)
{
    /* If bk tree does not exist, build a new one*/
    if (root == NULL) {
        root = malloc(sizeof(bktree_node));

        /* Initialize root node*/
        strcpy(root->entry_in_node.lastName, lastName);
        root->distance_to_parent = -1;
        root->child = NULL;
        root->sibling = NULL;

        return root;
    } else {
        bktree_node *tmp = root;
        while (1) {
            int dist = lev_dist_iteration(tmp->entry_in_node.lastName,
                                          strlen(tmp->entry_in_node.lastName),
                                          lastName, strlen(lastName));

            /* Found there is an identical last name in the bk tree
             * (dist=0), do not insert new node and just return NULL.
             */
            if (!dist) {
                return NULL;
            }

            /* If there is a child, compute the dist between the given
             * last name and the last name in the child (or in the siblings).
             * And check if there is any child or sibling which has same
             * distance_to_parent.
             */
            bktree_node *child = tmp->child;
            while (child) {
                if (child->distance_to_parent == dist) {
                    tmp = child;
                    break;
                }
                child = child->sibling;
            }

            if (!child) {
                bktree_node *new_child = malloc(sizeof(bktree_node));
                strcpy(new_child->entry_in_node.lastName, lastName);
                new_child->distance_to_parent = dist;
                new_child->sibling = tmp->child;
                tmp->child = new_child;

                return new_child;
            }
        }
    }
}

size_t *search_bktree(char lastName[], bktree_node *root, int dist_range)
{
    if ( !root )
        return 0;

    int dist = 0;
    bktree_node *cur = root;
    while (!cur) {
        dist = lev_dist_iteration(cur->entry_in_node.lastName,
                                  strlen(cur->entry_in_node.lastName),
                                  lastName, strlen(lastName));
        if (dist <= dist_range)
            printf("dist = %d, %s\n", dist, cur->entry_in_node.lastName);

        bktree_node *child = cur->child;
        while (child) {
            if ((dist - dist_range) <= child->distance_to_parent &&
                    child->distance_to_parent <= (dist + dist_range)) {
                child = child->sibling;
            }
        }
    }
    return 0;
}