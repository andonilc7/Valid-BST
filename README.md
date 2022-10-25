# Valid-BST HackerRank Problem

Used two arrays, one which would store the numbers, and in the other which would store the index of the backpointer for each node (a node has a backpointer if it is a right child). If the node is greater than the previous node, then the get_backpointer function is applied to find the backpointer of that node. At the end, a function goes through the backpointer array to make sure that, if the node backpoints to something, then in the pre-order list all of the elements to the right of that node are greater than the value of the backpointer.
