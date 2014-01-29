//* Description *//
// Usage: collision_mask(left[0], top[0], right[0], bottom[0], left[1], top[1], right[1], bottom[1]);
// Function: Returns whether or not the specified Rectangular Masks Collide
// Arguments:
// 1) left[0] : int - The Left (or Right) Bound of the First Mask
// 2) top[0] : int - The Top (or Bottom) Bound of the First Mask
// 3) right[0] : int - The Right (or Left) Bound of the First Mask
// 4) bottom[0] : int - The Bottom (or Top) Bound of the First Mask
// 5) left[1] : int - The Left (or Right) Bound of the Second Mask
// 6) top[1] : int - The Top (or Bottom) Bound of the Second Mask
// 7) right[1] : int - The Right (or Left) Bound of the Second Mask
// 8) bottom[1] : int - The Bottom (or Top) Bound of the Second Mask

//* Arguments *//
var left, top, right, bottom;

left[0] = int(argument0);
top[0] = int(argument1);
right[0] = int(argument2);
bottom[0] = int(argument3);
left[1] = int(argument4);
top[1] = int(argument5);
right[1] = int(argument6);
bottom[1] = int(argument7);

//* Main Body *//
// Determine the Actual Bounds
left[2] = min(left[0], right[0]);
top[2] = min(top[0], bottom[0]);
right[2] = max(left[0], right[0]);
bottom[2] = max(top[0], bottom[0]);
left[3] = min(left[1], right[1]);
top[3] = min(top[1], bottom[1]);
right[3] = max(left[1], right[1]);
bottom[3] = max(top[1], bottom[1]);

// Determine if the the Bounding Boxes Collide
if(right[2] < left[3]) // Left Bound
    return false;
else if(left[2] > right[3]) // Right Bound
    return false;
else if(bottom[2] < top[3]) // Top Bound
    return false;
else if(top[2] > bottom[3]) // Bottom Bound
    return false;
else
    return true;
