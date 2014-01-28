var list, height, i;

list = argument0

height = 0
for(i = 0; i < ds_list_size(list); i += 1)
    if(string_height(ds_list_find_value(list, i)) > height)
        height = string_height(ds_list_find_value(list, i))

return height
