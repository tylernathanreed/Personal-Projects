//* Description *//
// Arguments: x1 : int, y1 : int, x2 : int, y2 : int, border : boolean, gui : boolean
// Function: Returns whether or not the Mouse is within the specified Rectangle

//* Arguments *//
var x1, y1, x2, y2, border, gui;

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
border = argument4;
gui = argument5;

var mx, my;
if(gui)
{
    mx = window_mouse_get_x();
    my = window_mouse_get_y();
}
else
{
    mx = mouse_x;
    my = mouse_y;
}

if(border) // Include Borders
{
    if(mx >= x1 || mx >= x2)
        if(my >= y1 || my >= y2)
            if(mx <= x1 || mx <= x2)
                if(my <= y1 || my <= y2)
                    return true;
}
else // Exlude Borders
{
    if(mx > x1 || mx > x2)
        if(my > y1 || my > y2)
            if(mx < x1 || mx < x2)
                if(my < y1 || my < y2)
                    return true;
}

return false;
