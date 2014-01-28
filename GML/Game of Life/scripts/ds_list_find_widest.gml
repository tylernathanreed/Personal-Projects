var list, width, i;

list = argument0

width = 0
for(i = 0; i < ds_list_size(list); i += 1)
    if(string_width(ds_list_find_value(list, i)) > width)
        width = string_width(ds_list_find_value(list, i));

return width

