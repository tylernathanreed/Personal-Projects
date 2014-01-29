//* Description *//
// Usage: transition_block_fall(surface[0], surface[1], fraction);
// Function: Displays a Falling Block Transition between the specified Surfaces with the specified Attributes
// Arguments:
// 1) surface[0] : int - The Surface ID of the Starting Surface
// 2) surface[1] : int - The Surface ID of the Ending Surface
// 5) fraction : real - The Step of the Transition (0 - 1)

//* Arguments *//
var surface, fraction;

surface[0] = argument0;
surface[1] = argument1;
fraction = real(argument4);

//* Main Body *//
// Determine the Surface Attributes
var width, height;

width = surface_get_width(surface[0]);
height = surface_get_height(surface[1]);

// Set the Block Attributes
var size, lifetime, torque;

size = cell_size;
lifetime = 0.4;
torque = 180;

// Draw the Final Surface
draw_surface(surface[1], 0, 0);

// Determine the Block Diagonal
var diagonal = size/2 * sqrt(2);

// Draw each Block
for(top = 0; top < height; top += size)
    for(left = 0; left < width; left += size)
    {
        // Determine the Starting Point
        var start = (1 - lifetime)*(abs(width/2 - left - size/2)/width + (1 - top/height)*0.5);

        // Check if the Transition has not yet begun
        if(fraction < start)
            draw_surface_part(surface[0], left, top, size, size, left, top);
        else
        {
            // Determine the Lifetime that has Passed
            var delta = (fraction - start)/lifetime;

            // Determine the Position of the Block
            var cx, cx;

            var cx = left + size/2;
            var cy = top + delta*height + size/2;

            // Determine the Rotation of the Block
            var rotation = delta * torque;

            if(cx < width/2)
                rotation = -rotation;

            // Adjust the Position of the Block by its Rotation
            cx = cx - lengthdir_x(diagonal, rotation - 45);
            cy = cy - lengthdir_y(diagonal, rotation - 45);

            // Draw the Block
            draw_surface_general(surface[0], left, top, size, size, cx, cy, 1, 1, rotation, c_white, c_white, c_white, c_white, 1);
        }
    }
