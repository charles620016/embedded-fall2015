#include <stddef.h>
#include "binary_tree.h"

tree_node *_flatten(tree_node *node)
{
    if (node == NULL)
        return NULL;

    /* flatten right subtree first */
    if (node->right != NULL)
        node->right = _flatten(node->right);

    if (node->left != NULL) {
        tree_node *right_head = node->right;
        node->right = _flatten(node->left);

        /* find the last node and then concatenate with right_head*/
        tree_node *cur = node->right;
        while (cur->right) {
            cur = cur->right;
        }
        cur->right = right_head;
        node->left = NULL;
    }

    return node;
}

void flatten(tree_node *root)
{
    _flatten(root);
}