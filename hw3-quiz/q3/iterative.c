#include <stddef.h>
#include "binary_tree.h"

void flatten(tree_node *root)
{
    tree_node* tmp;
    while (root != NULL) {
        if (root->left != NULL) {
            tmp = root->left;
            while (tmp->right != NULL)
                tmp = tmp->right;
            tmp->right = root->right;
            root->right = root->left;
            root->left = NULL;
        }
        root = root->right;
    }
}