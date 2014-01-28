//* Description *//
// Arguments: node : ds_node, child : ds_node
// Function: Returns the Index of the Parent Node

//* Arguments *//
var node, child;

node = argument0;
child = argument1;

var i;
for(i = 0; i < ds_node_get_degree(node); i += 1)
    if(ds_node_get_child(i) == child)
        return i;

return -1;
