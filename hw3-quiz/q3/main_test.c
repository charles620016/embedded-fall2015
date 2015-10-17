#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include "binary_tree.h"

#define INPUT_SIZE 16
#define MODULE_NUMBER 97

int main(int argc, char const *argv[])
{
    /* create a binary search tree */
    tree_node *root = NULL;
    srand(time(NULL));
    root = insert(root, rand() % MODULE_NUMBER);
    for (int i = 1; i < INPUT_SIZE; i++) {
        insert(root, rand() % MODULE_NUMBER);
    }

    printf("before flattening - preorder_traversal \n");
    preorder_traversal(root);
    printf("\nbefore flattening - right_child_traversal \n");
    right_child_traversal(root);

    flatten(root);

    printf("\nafter flattening - preorder_traversal \n");
    preorder_traversal(root);
    printf("\nafter flattening - right_child_traversal \n");
    right_child_traversal(root);

    return 0;
}