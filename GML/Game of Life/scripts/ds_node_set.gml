//* Description *//
// Arguments: node : ds_node, data : string
// Function: Sets the stored Data of the Node

//* Arguments *//
var node, data;

node = argument0;
data = argument1;

return ds_list_replace(node, 0, data); // Data Index
