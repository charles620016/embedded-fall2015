#ifndef _BINARY_TREE_H
#define _BINARY_TREE_H

typedef struct tree_node_t {
    int data;
    struct tree_node_t *left;
    struct tree_node_t *right;
} tree_node;

tree_node *insert(tree_node *root, int data);
tree_node *search(tree_node *root, int data);
void preorder_traversal(tree_node *node);
void right_child_traversal(tree_node *node);
#endif