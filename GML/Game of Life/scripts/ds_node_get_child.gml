//* Description *//
// Arguments: node : ds_node, index : int
// Function: Returns the stored Data of the Node

//* Arguments *//
var node, index;

node = argument0;
index = argument1;

return ds_list_find_value(node, index + 3); // Node Indeces
