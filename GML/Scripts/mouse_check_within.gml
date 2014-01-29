//* Description *//
// Usage: mouse_check_within(x1, y1, x2, y2, border);
// Function: Returns whether or not the Mouse is within the specified Rectangle
// Arguments:
// 1) x1 : int - The Left or Right Boundary of the Rectangle
// 2) y1 : int - The Top or Bottom Boundary of the Rectangle
// 3) x2 : int - The Right or Left Boundary of the Rectangle
// 4) y2 : int - The Bottom or Top Boundary of the Rectangle
// 5) border : bool - Whether or not to include the Border

//* Arguments *//
var x1, y1, x2, y2, border;

x1 = int(argument0);
y1 = int(argument1);
x2 = int(argument2);
y2 = int(argument3);
border = bool(argument4);

//* Main Body *//
// Return whether or not the Mouse is within the specified Rectangle
return point_check_within(mouse_x, mouse_y, x1, y1, x2, y2, border);
