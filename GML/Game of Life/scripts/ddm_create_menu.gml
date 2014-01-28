//* Description *//
//* Arguments: x : int, y : int, list : ds_list, scroll : int, font : font
// Creates a Menu with the specified Attributes

//* Arguments *//
var xx, yy, list, scroll, font, menu;

xx = argument0;
yy = argument1;
list = argument2;
scroll = argument3;
font = argument4;
menu = instance_create(xx, yy, obj_ddm);

menu.list = list;

menu.option = ds_list_find_value(menu.list, 0);

if(scroll < 3)
    menu.maxScroll = 3;
else
    menu.maxScroll = scroll;

menu.font = font;

menu.adjust = true;
menu.button_width = ds_list_find_widest(menu.list)+8; //Button Width
menu.button_height = ds_list_find_highest(menu.list)+8; //Button Height

return menu.id;
