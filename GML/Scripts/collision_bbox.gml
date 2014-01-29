//* Description *//
// Usage: collision_bbox(instance[0], instance[1]);
// Function: Returns whether or not the specified Instances Collide via Bounding Boxes
// Arguments:
// 1) instance[0] : int - The First specified Instance
// 2) instance[1] : int - The Second specified Instance

//* Arguments *//
var instance;

instance[0] = argument0;
instance[1] = argument1;

//* Main Body *//
var top, left, bottom, right;

// Parse each Target
for(var i = 0; i < 2; i++)
{
    // Convert 'Self' and 'Other' Targets
    if(instance[i] == self || instance[i] == other)
        instance[i] = instance[i].id;

    // Make sure the Instances Exist
    if(!instance_exists(instance[i]))
        return false;

    // Check for Non-Existant Collision Boxes
    if(!sprite_exists(instance[i].sprite_index) && !sprite_exists(instance[i].mask_index))
    {
        top[i] = min(instance[i].y1, instance[i].y2);
        left[i] = min(instance[i].x1, instance[i].x2);
        bottom[i] = max(instance[i].y1, instance[i].y2);
        right[i] = max(instance[i].x1, instance[i].x2);
    }
    else
    {
        top[i] = instance[i].bbox_top;
        left[i] = instance[i].bbox_left;
        bottom[i] = instance[i].bbox_bottom;
        right[i] = instance[i].bbox_right;
    }
}

// Determine if the the Bounding Boxes Collide
if(right[0] < left[1]) // Left Bound
    return false;
else if(left[0] > right[1]) // Right Bound
    return false;
else if(bottom[0] < top[1]) // Top Bound
    return false;
else if(top[0] < bottom[1]) // Bottom Bound
    return false;
else
    return true;
