//* Description *//
// Arguments: items : string...
// Function: Converts a list of string parameters to a List

//* Arguments *//
var list, i;

list = ds_list_create();

for(i = 0; i < 16; i += 1)
    if(is_string(argument[i]) && string(argument[i]) != "")
        ds_list_add(list, argument[i]);
    else
        break;

return list;
