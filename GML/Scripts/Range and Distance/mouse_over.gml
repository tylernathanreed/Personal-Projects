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

