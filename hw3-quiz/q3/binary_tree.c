#include <stdio.h>
#include <stdlib.h>
#include "binary_tree.h"

/* insert new node into binary search tree */
tree_node *insert(tree_node *root, int data)
{
    if (root == NULL){
        tree_node *tmp = (tree_node *)malloc(sizeof(tree_node));
        tmp->data = data;
        tmp->right = tmp->left = NULL;
        return tmp;
    }
    if(data > root->data)
        root->right = insert(root->right, data);
    else if (data < root->data)
        root->left = insert(root->left, data);
    return root;
}

tree_node *search(tree_node *root, int data)
{
    if(root==NULL)
        return NULL;
    if(data == root->data)
        return root;
    if(data < root->data)
        return search(root->left, data);
    return search(root->right, data);
}

void preorder_traversal(tree_node *node)
{
    if (node != NULL) {
        printf("%d, ", node->data);
        preorder_traversal(node->left);
        preorder_traversal(node->right);
    }
}

void right_child_traversal(tree_node *node){
    if (node != NULL) {
        printf("%d, ", node->data);
        right_child_traversal(node->right);
    }
}