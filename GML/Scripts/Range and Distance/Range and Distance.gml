#define instance_distance
//* Description *//
// Usage: instance_distance(instance[0], instance[1]);
// Function: Returns the Distance between the two specified Instances
// Arguments:
// 1) instance[0] : int - Instance ID of the First Instance
// 2) instance[1] : int - Instance ID of the Second Instance

//* Arguments *//
var instance;

instance[0] = inst(argument0);
instance[1] = inst(argument1);

//* Main Body *//
// Make sure that the Instances Exist
if(!instance_exists(instance[0]) || !instance_exists(instance[1]))
    return -1;

// Determine the Location of the Instances
var x1, y1, x2, y2;

x1 = instance[0].x;
y1 = instance[0].y;
x2 = instance[1].x;
y2 = instance[1].y;

// Return the Distance between the two specified Instances
return point_distance(x1, y1, x2, y2);



#define mouse_check_within
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



#define mouse_over
//* Description *//
// Usage: mouse_over(instance, precise);
// Function: Returns whether or not the Mouse is Over the specified Instance
// Arguments:
// 1) instance : inst - The specified Instance
// 2) precise : bool - Whether or not to do Precise Checking

//* Arguments *//
var instance, precise;

instance = inst(argument0);
precise = bool(argument1);

//* Main Body *//
// Make sure the Instance Exists
if(!instance_exists(instance))
    return false;

// Determine the Instance Bounds
var x1, y1, x2, y2;

x1 = instance.bbox_left;
y1 = instance.bbox_top;
x2 = instance.bbox_right;
y2 = instance.bbox_bottom;

// Perform Inprecise Check
if(!mouse_check_within(x1, y1, x2, y2, true))
    return false;
else if(!precise)
    return true;

// Perform Precise Check
return place_meeting(mouse_x, mouse_y, instance);



#define point_check_within
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