//* Description *//
// Arguments: node : ds_node, child : ds_node;
// Function: Returns whether or not the Child was added

//* Arguments *//
var node, child;

node = argument0;
child = argument1;

var count, degree;

count = ds_node_get_count(node);
degree = ds_node_get_degree(node);

// Make sure Node can have more Children
if(count + 1 != degree)
{
    ds_list_replace(node, count + 3, child); // Add Child
    ds_list_replace(node, 1, count + 1); // Increase Child Count
    return true;
}

return false;
