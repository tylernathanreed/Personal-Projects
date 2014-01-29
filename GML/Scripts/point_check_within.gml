//* Description *//
// Usage: point_check_within(px, py, x1, y1, x2, y2, border);
// Function: Returns whether or not the specified Point is within the specified Rectangle
// Arguments:
// 1) px : int - The X Location of the Point
// 2) py : int - The Y Location of the Point
// 3) x1 : int - The Left or Right Boundary of the Rectangle
// 4) y1 : int - The Top or Bottom Boundary of the Rectangle
// 5) x2 : int - The Right or Left Boundary of the Rectangle
// 6) y2 : int - The Bottom or Top Boundary of the Rectangle
// 7) border : bool - Whether or not to include the Border

//* Arguments *//
var px, py, x1, y1, x2, y2, border;

px = int(argument0);
py = int(argument1);
x1 = int(argument2);
y1 = int(argument3);
x2 = int(argument4);
y2 = int(argument5);
border = bool(argument6);

//* Main Body *//
// Determine whether or not to Include the Border
if(border)
    return (px >= x1 || px >= x2) && // Check Left Boundary
           (py >= y1 || py >= y2) && // Check Top Boundary
           (px <= x2 || px <= x1) && // Check Right Boundary
           (py <= y2 || py <= y1);   // Check Bottom Boundary
else
    return (px > x1 || px > x2) && // Check Left Boundary
           (py > y1 || py > y2) && // Check Top Boundary
           (px < x2 || px < x1) && // Check Right Boundary
           (py < y2 || py < y1);   // Check Bottom Boundary
