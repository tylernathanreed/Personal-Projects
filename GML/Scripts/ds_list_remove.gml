//* Description *//
// Usage: ds_list_remove(list, value);
// Function: Removes the specified Value from the specified List
// Arguments:
// 1) list : ds_list - The ID of the specified List
// 2) value : any - The specified Value

//* Arguments *//
var list, value;

list = argument0;
value = argument1;

//* Main Body *//
// Make sure the specified Value is in the List
var index;

index = ds_list_find_index(list, value);

// Remove the specified Value from the specified List
if(index >= 0)
    ds_list_delete(list, ds_list_find_index(list, value));
