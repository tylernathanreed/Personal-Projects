//* Description *//
// Arguments: None
// Function: Creates a Node Data Structure

//* Attributes *//
var list, data, count, degree;

list = ds_list_create(); // Node Simulator
data = ""; // Stored Data Value
count = 0; // Current Number of Children
degree = 4; // Maximum Number of Children

ds_list_add(list, data); // 0
ds_list_add(list, count); // 1
ds_list_add(list, degree); // 2

// Nodes: 3, 4, ... , degree
var i;
for(i = 0; i < degree; i += 1)
    ds_list_add(list, -1);

return list;
