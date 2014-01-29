//* Description *//
// Usage: instance_distance(instance[0], instance[1]);
// Function: Returns the Distance between the two specified Instances
// Arguments:
// 1) instance[0] : int - Instance ID of the First Instance
// 2) instance[1] : int - Instance ID of the Second Instance

//* Arguments *//
var instance;

instance[0] = argument0.id;
instance[1] = argument1.id;

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
