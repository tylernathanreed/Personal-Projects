//* Description *//
// Usage: mouse_check_over(x1, y1, x2, y2 [, border [, window]])
// Function: Returns whether or not the Mouse is within the specified Rectangle
// Arguments:
// 1) x1 : int - Starting X position of the Bounding Box
// 2) y1 : int - Starting Y position of the Bounding Box
// 3) x2 : int - Stopping X position of the Bounding Box
// 4) y2 : int - Stopping Y position of the Bounding Box
// 5) border : boolean - Include Edges of the Bounding Box
// 6) window : boolean - Use Window Mouse coordinates instead

//* Arguments *//
var x1, y1, x2, y2, border, window;

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;

if(argument_count > 4)
    border = argument4;
else
    border = false;

if(argument_count > 5)
    window = argument5;
else
    window = false;

//* Main Body *//
var mx, my;

if(window) // Use Window Mouse coordinates
{
    mx = window_mouse_get_x();
    my = window_mouse_get_y();
}
else // Use Normal Mouse coordinates
{
    mx = mouse_x;
    my = mouse_y;
}

if(border) // Include Edges of the Bounding Box
{
    if(x1 <= mx || x2 <= mx) // Left Bound Check
        if(y1 <= my || y2 <= my) // Top Bound Check
            if(x1 >= mx || x2 >= mx) // Right Bound Check
                if(y1 >= my || y2 >= my) // Bottom Bound Check
                    return true;
}
else // Do not include Edges of the Bounding Box
{
    if(x1 < mx || x2 < mx) // Left Bound Check
        if(y1 < my || y2 < my) // Top Bound Check
            if(x1 > mx || x2 > mx) // Right Bound Check
                if(y1 > my || y2 > my) // Bottom Bound Check
                    return true;
}

return false;
