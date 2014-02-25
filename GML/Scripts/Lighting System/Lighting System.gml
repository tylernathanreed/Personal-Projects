#define lsys_system_create
//* Description *//
// Usage: lsys_system_create(quality, alpha);
// Function: Initializes the Light System
// Arguments:
// 1) quality : real - Lighting Quality (Between 0 : Low and 1 : High)
// 2) alpha : real - Ambient Darkness (Between 0 : Low and 1 : High)

//* Arguments *//
var quality, alpha;

quality = argument0;
alpha = argument1;

//* Main Body *//
// Create the Lighting System
global.light_system = ds_map_create();

// Add the System Attributes
ds_map_add(global.light_system, "lights", ds_list_create());
ds_map_add(global.light_system, "casters", ds_list_create());
ds_map_add(global.light_system, "quality", max(10/max(room_width, room_height), quality));
ds_map_add(global.light_system, "alpha", clamp(alpha, 0 ,1));
ds_map_add(global.light_system, "changed", true);

// Create the Lighting Surface
var width, height;

width = room_width * ds_map_find_value(global.light_system, "quality");
height = room_height * ds_map_find_value(global.light_system, "quality");

ds_map_add(global.light_system, "surface", surface_create(width, height));

#define lsys_system_get_light
//* Description *//
// Usage: lsys_system_get_light(index);
// Function: Returns the Light with the specified Index
// Arguments:
// 1) index : int - The Index of the specified Light

//* Arguments *//
var index;

index = argument0;

//* Main Body *//
// Determine the Light List
var list = ds_map_find_value(global.light_system, "lights");

// Return the Light with the specified Index
return ds_list_find_value(list, index);

#define lsys_system_get_caster
//* Description *//
// Usage: lsys_system_get_caster(index);
// Function: Returns the Caster with the specified Index
// Arguments:
// 1) index : int - The Index of the specified Caster

//* Arguments *//
var index;

index = argument0;

//* Main Body *//
// Determine the Caster List
var list = ds_map_find_value(global.light_system, "casters");

// Return the Caster with the specified Index
return ds_list_find_value(list, index);

#define lsys_system_get_quality
//* Description *//
// Usage: lsys_system_get_quality();
// Function: Returns the Quality of the Light System
// Arguments: None

//* Main Body *//
// Return the Quality of the Light System
return ds_map_find_value(global.light_system, "quality");

#define lsys_system_get_alpha
//* Description *//
// Usage: lsys_system_get_alpha();
// Function: Returns the Alpha of the Light System
// Arguments: None

//* Main Body *//
// Return the Alpha of the Light System
return ds_map_find_value(global.light_system, "alpha");

#define lsys_system_get_surface
//* Description *//
// Usage: lsys_system_get_surface();
// Function: Returns the Surface of the Light System
// Arguments: None

//* Main Body *//
// Return the Surface of the Light System
return ds_map_find_value(global.light_system, "surface");

#define lsys_system_set_alpha
//* Description *//
// Usage: lsys_system_set_alpha(alpha);
// Function: Sets the Alpha of the Light System
// Arguments:
// 1) alpha : real - The New Ambient Darkness of the System (0 : Low - 1 : High)

//* Main Body *//
// Determine the Alpha of the Light System
var old = lsys_system_get_alpha();

// Make sure the Alpha Changed
if(old == alpha)
    return false;

// Set the Alpha of the Light System
ds_map_replace(global.light_system, "alpha", clamp(alpha, 0, 1));

// Mark the System as Changed
ds_map_replace(global.light_system, "changed", true);

return true;

#define lsys_system_light_count
//* Description *//
// Usage: lsys_system_light_count();
// Function: Returns the Number of Lights in the System
// Arguments: None

//* Main Body *//
// Determine the Light List
var lights = ds_map_find_value(global.light_system, "lights");

// Return the Number of Lights
return ds_list_size(lights);

#define lsys_system_caster_count
//* Description *//
// Usage: lsys_system_caster_count();
// Function: Returns the Number of Casters in the System
// Arguments: None

//* Main Body *//
// Determine the Caster List
var casters = ds_map_find_value(global.light_system, "casters");

// Return the Number of Casters
return ds_list_size(casters);

#define lsys_system_update
//* Description *//
// Usage: lsys_system_update();
// Function: Updates the Light System
// Arguments: None

//* Main Body *//
// Set the Darkness Color
draw_set_color(c_black);

// Determine the List of Lights
var lights = ds_map_find_value(global.light_system, "lights");

// Draw each Light
for(var i = 0; i < ds_list_size(lights); i++)
{
    // Determine the Current Light
    var light = ds_list_find_value(lights, i);

    // Ignore Lights that have not been Changed
    if(!ds_map_find_value(light, "changed"))
        continue;

    // Determine the Attributes of the Light
    var lx, ly, radius, rotation, sprite, color, surface_light;

    lx = lsys_light_get_x(light);
    ly = lsys_light_get_y(light);
    radius = lsys_light_get_radius(light);
    rotation = lsys_light_get_rotation(light);
    sprite = lsys_light_get_sprite(light);
    color = lsys_light_get_color(light);
    surface_light = lsys_light_get_surface(light);

    // Set the Surface Target to the Light Surface
    surface_set_target(surface_light);

    // Reset the Light Surface
    draw_clear(c_black);

    // Determine whether or not the Light has a Sprite
    if(sprite_exists(sprite)) // Sprite Exists
    {
        // Determine the Scale of the Sprite
        var xscale, yscale;

        xscale = radius / sprite_get_width(sprite);
        yscale = radius / sprite_get_height(sprite);

        // Draw a Sprite Light
        // The Surface is Radius * 2 in Width and Height
        // Drawing at [Radius, Radius] will be the Center of the Surface
        draw_sprite_ext(sprite, 0, radius, radius, xscale, yscale, rotation, c_white, 1);
    }
    else // Sprite does not Exist
    {
        // Draw a Generic Light (Circle)
        // The Surface is Radius * 2 in Width and Height
        // Drawing at [Radius, Radius] will be the Center of the Surface
        draw_circle_color(radius, radius, radius, c_white, c_black, false);
    }

    // Determine the Drawing Position of the Light
    var dx, dy;

    dx = radius - lx;
    dy = radius - ly;

    // Determine the List of Casters
    var casters = ds_map_find_value(global.light_system, "casters");

    // Determine which Casters are Projected Upon
    for(var j = 0; j < ds_list_size(casters); j++)
    {
        // Determine the Current Caster
        var caster = ds_list_find_value(casters, j);

        // Ignore Casters Outside of the Light
        if(!lsys_caster_inside(caster, light))
            continue;

        // Determine the Position of the Caster
        var cx, cy;

        cx = lsys_caster_get_x(caster);
        cy = lsys_caster_get_y(caster);

        // Determine the Radius Multiplier
        // This needs to be High enough to make
        // the End-Points be Outside of the Room
        var mul = 10;

        // Begin Drawing the Casted Shadow
        draw_primitive_begin(pr_trianglestrip);

        // Determine the Point List of the Caster
        var points = ds_map_find_value(caster, "points");

        // Draw the Caster on the Light
        for(var k = 0; k < ds_list_size(points); k++)
        {
            // Determine the Current Point
            var point = ds_list_find_value(points, k);

            // Determine the Position of the Current Point
            var px, py;

            px = lsys_caster_point_get_x(point);
            py = lsys_caster_point_get_y(point);

            // Determine the Direction between the Light and the Caster Point
            var dir = point_direction(lx, ly, cx + px, cy + py);

            // Determine the Position of the Vertices
            var x1, y1, x2, y2;

            x1 = dx + cx + px;
            y1 = dy + cy + py;
            x2 = x1 + lengthdir_x(radius * mul, dir);
            y2 = y1 + lengthdir_y(radius * mul, dir);

            draw_vertex(x1, y1);
            draw_vertex(x2, y2);
        }

        // Determine the First Caster Point
        var point = ds_list_find_value(points, 0);

        // Determine the Position of the First Point
        var px, py;

        px = lsys_caster_point_get_x(point);
        py = lsys_caster_point_get_y(point);

        // Determine the Direction between the Light and the Caster Point
        var dir = point_direction(lx, ly, cx + px, cy + py);

        // Determine the Position of the Vertices
        var x1, y1, x2, y2;

        x1 = dx + cx + px;
        y1 = dy + cy + py;
        x2 = x1 + lengthdir_x(radius * mul, dir);
        y2 = y1 + lengthdir_y(radius * mul, dir);

        // Draw the First Point to Reconnect
        draw_vertex(x1, y1);
        draw_vertex(x2, y2);

        // Stop Drawing the Casted Shadow
        draw_primitive_end();
    }

    // Unmark the Light as Changed
    ds_map_replace(light, "changed", false);
}

// Determine the Surface of the Light System
var surface = lsys_system_get_surface();

// Set the Surface Target to the Light System Surface
surface_set_target(surface);

// Reset the Light System Surface
draw_clear(c_black);

// Set the Blend Mode to Additive
draw_set_blend_mode(bm_add);

// Draw the Light Surfaces
for(var i = 0; i < ds_list_size(lights); i++)
{
    // Determine the Current Light
    var light = ds_list_find_value(lights, i);

    // Determine the Light Attributes
    var lx, ly, radius, rotation, color, surface_light;

    lx = lsys_light_get_x(light);
    ly = lsys_light_get_y(light);
    radius = lsys_light_get_radius(light);
    color = lsys_light_get_color(light);
    surface_light = lsys_light_get_surface(light);

    // Draw the Light Surface
    draw_surface_ext(surface_light, lx - radius, ly - radius, 1, 1, 0, color, 1);
    
}

// Reset the Blend Mode
draw_set_blend_mode(bm_normal);

// Determine the Quality and Alpha of the Light System
var quality, alpha;

quality = lsys_system_get_quality();
alpha = lsys_system_get_alpha();

// Draw the Ambient Darkness
draw_set_alpha(1 - alpha);
draw_set_color(c_white);
draw_rectangle(0, 0, room_width * quality, room_height * quality, false);

// Reset the Drawing Attributes
draw_set_alpha(1);

// Reset the Surface Target
surface_reset_target();

// Set the Light System as Updated
ds_map_replace(global.light_system, "changed", false);

#define lsys_system_draw
//* Description *//
// Usage: lsys_system_draw();
// Function: Draws the Entire Light System
// Arguments: None

//* Main Body *//
// Update the Light System if Necessary
if(ds_map_find_value(global.light_system, "changed"))
    lsys_system_update();

// Determine the Light System Surface
var surface = lsys_system_get_surface();

// Set the Blend Mode
draw_set_blend_mode_ext(bm_dest_color, bm_zero);

// Determine the System Attributes
var left, top, width, height, xx, yy, scale;

left = view_xview[view_current] * lsys_system_get_quality();
top = view_yview[view_current] * lsys_system_get_quality();
width = view_wview[view_current] * lsys_system_get_quality();
height = view_hview[view_current] * lsys_system_get_quality();
xx = view_xview[view_current];
yy = view_yview[view_current];
scale = 1/lsys_system_get_quality();

// Draw the Entire Light System
draw_surface_part_ext(surface, left, top, width, height, xx, yy, scale, scale, c_white, 1);

// Reset the Blend Mode
draw_set_blend_mode(bm_normal);

#define lsys_system_free
//* Description *//
// Usage: lsys_system_free();
// Function: Frees all Surfaces, Lights, and Casters from the Light System
// Arguments: None

//* Main Body *//
// Determine the List of Lights
var lights = ds_map_find_value(global.light_system, "lights");

// Free the Lights
for(var i = 0; i < ds_list_size(lights); i++)
{
    // Determine the Current Light
    var light = ds_list_find_value(lights, i);

    // Free the Light's Surface
    surface_free(lsys_light_get_surface(light));

    // Destroy the Light
    ds_map_destroy(light);
}

// Destroy the List of Lights
ds_list_destroy(lights);

// Determine the List of Casters
var casters = ds_map_find_value(global.light_system, "casters");

// Free the Casters
for(var i = 0; i < ds_list_size(casters); i++)
{
    // Determine the Current Caster
    var caster = ds_list_find_value(casters, i);

    // Determine the Point List of the Current Caster
    var points = ds_map_find_value(caster, "points");

    // Free the Points
    for(var j = 0; j < ds_list_size(points); j++)
    {
        // Determine the Current Point
        var point = ds_list_find_value(points, j);

        // Destroy the Point
        ds_map_destroy(point);
    }

    // Destroy the List of Points
    ds_list_destroy(points);
}

// Destroy the List of Casters
ds_list_destroy(casters);

// Destroy the System
ds_map_destroy(global.light_system);

#define lsys_light_create
//* Description *//
// Usage: lsys_light_create(xx, yy, radius, color);
// Function: Creates a Light with the specified Attributes
// Arguments:
// 1) xx : int - X Position of the Light
// 2) yy : int - Y Position of the Light
// 3) radius : int - The Radius of the Light
// 4) color : int - The Color of the Light
// 5) sprite : int - The ID of the Sprite of the Light

//* Arguments *//
var xx, yy, radius, color, sprite;

xx = argument0;
yy = argument1;
radius = argument2;
color = argument3;
sprite = argument4;

//* Main Body *//
// Create the Light
var light = ds_map_create();

// Add the Light Attributes
ds_map_add(light, "x", xx * lsys_system_get_quality());
ds_map_add(light, "y", yy * lsys_system_get_quality());
ds_map_add(light, "radius", radius * lsys_system_get_quality());
ds_map_add(light, "color", color);
ds_map_add(light, "sprite", sprite);
ds_map_add(light, "rotation", 0);
ds_map_add(light, "changed", true);

// Create the Light Surface
var size;

size = radius * 2 * lsys_system_get_quality();

ds_map_add(light, "surface", surface_create(size, size));

// Add the Light to the System
ds_list_add(ds_map_find_value(global.light_system, "lights"), light);

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

return light;

#define lsys_light_get_x
//* Description *//
// Usage: lsys_light_get_x(light);
// Function: Returns the X Position of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light

//* Arguments *//
var light;

light = argument0;

//* Main Body *//
// Return the X Position of the specified Light
return ds_map_find_value(light, "x");

#define lsys_light_get_y
//* Description *//
// Usage: lsys_light_get_y(light);
// Function: Returns the Y Position of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light

//* Arguments *//
var light;

light = argument0;

//* Main Body *//
// Return the Y Position of the specified Light
return ds_map_find_value(light, "y");

#define lsys_light_get_radius
//* Description *//
// Usage: lsys_light_get_radius(light);
// Function: Returns the Radius of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light

//* Arguments *//
var light;

light = argument0;

//* Main Body *//
// Return the Radius of the specified Light
return ds_map_find_value(light, "radius");

#define lsys_light_get_rotation
//* Description *//
// Usage: lsys_light_get_rotation(light);
// Function: Returns the Rotation (in Degrees) of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light

//* Arguments *//
var light;

light = argument0;

//* Main Body *//
// Return the Rotation (in Degrees) of the specified Light
return ds_map_find_value(light, "rotation");

#define lsys_light_get_sprite
//* Description *//
// Usage: lsys_light_get_sprite(light);
// Function: Returns the Sprite of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light

//* Arguments *//
var light;

light = argument0;

//* Main Body *//
// Return the Sprite of the specified Light
return ds_map_find_value(light, "sprite");

#define lsys_light_get_color
//* Description *//
// Usage: lsys_light_get_color(light);
// Function: Returns the Color of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light

//* Arguments *//
var light;

light = argument0;

//* Main Body *//
// Return the Color of the specified Light
return ds_map_find_value(light, "color");

#define lsys_light_get_surface
//* Description *//
// Usage: lsys_light_get_surface(light);
// Function: Returns the Surface of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light

//* Arguments *//
var light;

light = argument0;

//* Main Body *//
// Return the Surface of the specified Light
return ds_map_find_value(light, "surface");

#define lsys_light_set_position
//* Description *//
// Usage: lsys_light_set_position(light, xx, yy);
// Function: Sets the Position of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light
// 2) xx : int - The new X Position of the specified Light
// 3) yy : int - The new Y Position of the specified Light

//* Arguments *//
var light, xx, yy;

light = argument0;
xx = argument1;
yy = argument2;

//* Main Body *//
// Determine the Position of the specified Light
var old_x, old_y;

old_x = lsys_light_get_x(light);
old_y = lsys_light_get_y(light);

// Make sure the Position Changed
if(old_x == xx && old_y == yy)
    return false;

// Set the Position of the specified Light
ds_map_replace(light, "x", xx * lsys_system_get_quality());
ds_map_replace(light, "y", yy * lsys_system_get_quality());

// Mark the Light as Changed
ds_map_replace(light, "changed", true);

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

return true;

#define lsys_light_set_radius
//* Description *//
// Usage: lsys_light_set_radius(light, radius);
// Function: Sets the Radius of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light
// 2) radius : int - The new Radius of the specified Light

//* Arguments *//
var light, radius;

light = argument0;
radius = argument1;

//* Main Body *//
// Determine the Radius of the specified Light
var old_radius = lsys_light_get_radius(light);

// Make sure the Radius Changed
if(old_radius == radius)
    return false;

// Set the Radius of the specified Light
ds_map_replace(light, "radius", radius * lsys_system_get_quality());

// Mark the Light as Changed
ds_map_replace(light, "changed", true);

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

return true;

#define lsys_light_set_rotation
//* Description *//
// Usage: lsys_light_set_rotation(light, rotation);
// Function: Sets the Rotation of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light
// 2) rotation : int - The new Rotation (in Degrees) of the specified Light

//* Arguments *//
var light, rotation;

light = argument0;
rotation = argument1;

//* Main Body *//
// Determine the Rotation of the specified Light
var old_rotation = lsys_light_get_rotation(light);

// Make sure the Rotation Changed
if(old_rotation == rotation)
    return false;

// Set the Rotation of the specified Light
ds_map_replace(light, "rotation", rotation);

// Mark the Light as Changed
ds_map_replace(light, "changed", true);

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

return true;

#define lsys_light_set_sprite
//* Description *//
// Usage: lsys_light_set_sprite(light, sprite);
// Function: Sets the Sprite of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light
// 2) sprite : int - The new Sprite Index of the specified Light

//* Arguments *//
var light, radius;

light = argument0;
sprite = argument1;

//* Main Body *//
// Determine the Sprite of the specified Light
var old_sprite = lsys_light_get_sprite(light);

// Make sure the Sprite Changed
if(old_sprite == sprite)
    return false;

// Set the Radius of the specified Light
ds_map_replace(light, "sprite", sprite);

// Mark the Light as Changed
ds_map_replace(light, "changed", true);

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

return true;

#define lsys_light_set_color
//* Description *//
// Usage: lsys_light_set_color(light, color);
// Function: Sets the Color of the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light
// 2) color : int - The new Color of the specified Light

//* Arguments *//
var light, color;

light = argument0;
color = argument1;

//* Main Body *//
// Determine the Color of the specified Light
var old_color = lsys_light_get_color(light);

// Make sure the Color Changed
if(old_color == color)
    return false;

// Set the Color of the specified Light
ds_map_replace(light, "color", color);

// Mark the Light as Changed
ds_map_replace(light, "changed", true);

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

return true;

#define lsys_light_destroy
//* Description *//
// Usage: lsys_light_destroy(light);
// Function: Destroys the specified Light
// Arguments:
// 1) light : ds_map - The ID of the specified Light

//* Arguments *//
var light;

light = argument0;

//* Main Body *//
// Free the Light's Surface
surface_free(lsys_light_get_surface(light));

// Determine the Light List
var lights = ds_map_find_value(global.light_system, "lights");

// Remove the Light from the Light System
ds_list_remove(lights, light);

// Destroy the Light
ds_map_destroy(light);

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

#define lsys_caster_point_create
//* Description *//
// Usage: lsys_caster_add_point(caster, xx, yy);
// Function: Adds a Vertex to the Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster
// 2) xx : int - Relative (to the Caster) X Position of the Point
// 3) yy : int - Relative (to the Caster) Y Position of the Point

//* Arguments *//
var caster, xx, yy;

caster = argument0;
xx = argument1;
yy = argument2;

//* Main Body *//
// Create the Point
var point = ds_map_create();

// Add the Point Attributes
ds_map_add(point, "caster", caster);
ds_map_add(point, "x", xx * lsys_system_get_quality());
ds_map_add(point, "y", yy * lsys_system_get_quality());

// Add the Point to the Caster
ds_list_add(ds_map_find_value(caster, "points"), point);

// Update the Caster
lsys_caster_update(caster);

return caster;

#define lsys_caster_point_get_x
//* Description *//
// Usage: lsys_caster_point_get_x(point);
// Function: Returns the X Position of the specified Point
// Arguments:
// 1) point : ds_map - The ID of the specified Light

//* Arguments *//
var point;

point = argument0;

//* Main Body *//
// Return the X Position of the specified Point
return ds_map_find_value(point, "x");

#define lsys_caster_point_get_y
//* Description *//
// Usage: lsys_caster_point_get_y(point);
// Function: Returns the Y Position of the specified Point
// Arguments:
// 1) point : ds_map - The ID of the specified Light

//* Arguments *//
var point;

point = argument0;

//* Main Body *//
// Return the Y Position of the specified Point
return ds_map_find_value(point, "y");

#define lsys_caster_create
//* Description *//
// Usage: lsys_caster_create(xx, yy);
// Function: Creates a Caster with the specified Attributes
// Arguments:
// 1) xx : int - X Position of the Caster
// 2) yy : int - Y Position of the Caster

//* Arguments *//
var xx, yy;

xx = argument0;
yy = argument1;

//* Main Body *//
// Create the Caster
var caster = ds_map_create();

// Add the Caster Attributes
ds_map_add(caster, "x", xx * lsys_system_get_quality());
ds_map_add(caster, "y", yy * lsys_system_get_quality());
ds_map_add(caster, "cx", 0);
ds_map_add(caster, "cy", 0);
ds_map_add(caster, "points", ds_list_create());

// Add the Caster to the System
ds_list_add(ds_map_find_value(global.light_system, "casters"), caster);

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

return caster;

#define lsys_caster_get_x
//* Description *//
// Usage: lsys_caster_get_x(caster);
// Function: Returns the X Position of the specified Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster

//* Arguments *//
var caster;

caster = argument0;

//* Main Body *//
// Return the X Position of the specified Caster
return ds_map_find_value(caster, "x");

#define lsys_caster_get_y
//* Description *//
// Usage: lsys_caster_get_y(caster);
// Function: Returns the Y Position of the specified Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster

//* Arguments *//
var caster;

caster = argument0;

//* Main Body *//
// Return the Y Position of the specified Caster
return ds_map_find_value(caster, "y");

#define lsys_caster_get_center_x
//* Description *//
// Usage: lsys_caster_get_center_x(caster);
// Function: Returns the Center X Position of the specified Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster

//* Arguments *//
var caster;

caster = argument0;

//* Main Body *//
// Return the Center X Position of the specified Caster
return ds_map_find_value(caster, "cx");

#define lsys_caster_get_center_y
//* Description *//
// Usage: lsys_caster_get_center_y(caster);
// Function: Returns the Center Y Position of the specified Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster

//* Arguments *//
var caster;

caster = argument0;

//* Main Body *//
// Return the Center Y Position of the specified Caster
return ds_map_find_value(caster, "cy");

#define lsys_caster_get_point
//* Description *//
// Usage: lsys_caster_get_point(caster, index);
// Function: Returns the specified Point within the specified Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster
// 1) index : int - The Index of the specified Point

//* Arguments *//
var caster, index;

caster = argument0;
index = argument1;

//* Main Body *//
// Determine the Point List
var points = ds_map_find_value(caster, "points");

// Return the Point with the specified Index
return ds_list_find_value(points, index);

#define lsys_caster_set_position
//* Description *//
// Usage: lsys_caster_set_position(caster, xx, yy);
// Function: Sets the Position of the specified Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster
// 2) xx : int - The new X Position of the specified Caster
// 3) yy : int - The new Y Position of the specified Caster

//* Arguments *//
var caster, xx, yy;

caster = argument0;
xx = argument1;
yy = argument2;

//* Main Body *//
// Set the Position of the specified Caster
ds_map_replace(caster, "x", xx * lsys_system_get_quality());
ds_map_replace(caster, "y", yy * lsys_system_get_quality());

// Update the Caster
lsys_caster_update(caster);

#define lsys_caster_point_count
//* Description *//
// Usage: lsys_caster_point_count(caster);
// Function: Returns the Number of Points in the specified Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster

//* Arguments *//
var caster;

caster = argument0;

//* Main Body *//
// Determine the Point List
var points = ds_map_find_value(caster, "points");

// Return the Number of Points in the specified Caster
return ds_list_size(points);

#define lsys_caster_inside
//* Description *//
// Usage: lsys_caster_inside(caster, light);
// Function: Returns whether or not the specified Caster is within the specified Light
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster
// 2) light : ds_map - The ID of the specified Light

//* Arguments *//
var caster, light;

caster = argument0;
light = argument1;

//* Main Body *//
// Determine the Position of the Light
var lx, ly;

lx = lsys_light_get_x(light);
ly = lsys_light_get_y(light);

// Determine the Position of the Caster
var cx, cy;

cx = lsys_caster_get_x(caster);
cy = lsys_caster_get_y(caster);

// Determine the Radius of the Light
var radius = lsys_light_get_radius(light);

// Determine the Point List of the Caster
var points = ds_map_find_value(caster, "points");

// Check the Position of Each Point
for(var i = 0; i < ds_list_size(points); i++)
{
    // Determine the Current Point
    var point = ds_list_find_value(points, i);

    // Determine the Actual Position of the Point
    var px, py;

    px = cx + lsys_caster_point_get_x(point);
    py = cy + lsys_caster_point_get_y(point);

    // Determine whether or not the Current Point is Inside the Light
    var distance = point_distance(px, py, lx, ly);

    if(distance <= radius)
        return true;
}

return false;

#define lsys_caster_update
//* Description *//
// Usage: lsys_caster_update(caster);
// Function: Updates the Center Position of the Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster

//* Arguments *//
var caster;

caster = argument0;

//* Main Body *//
// Determine the List of Points
var points = ds_map_find_value(caster, "points");

// Determine the Initial Center Position
var cx = 0, cy = 0;

for(var i = 0; i < ds_list_size(points); i++)
{
    // Determine the Current Point
    var point = ds_list_find_value(points, i);

    // Offset the Center with the Point
    cx += lsys_caster_point_get_x(point);
    cy += lsys_caster_point_get_y(point);
}

// Average the Center Position
cx /= ds_list_size(points);
cy /= ds_list_size(points);

// Update the Caster Center-Position
ds_map_replace(caster, "cx", cx);
ds_map_replace(caster, "cy", cy);

// Determine the List of Lights
var lights = ds_map_find_value(global.light_system, "lights");

// Search for Lights that need to be Updated
for(var i = 0; i < ds_list_size(lights); i++)
{
    // Determine the Current Light
    var light = ds_list_find_value(lights, i);

    // Determine whether or not the Current Light needs to be Updated
    if(lsys_caster_inside(caster, light))
        ds_map_replace(light, "changed", true);
}

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

#define lsys_caster_destroy
//* Description *//
// Usage: lsys_caster_destroy(caster);
// Function: Destroys the specified Caster
// Arguments:
// 1) caster : ds_map - The ID of the specified Caster

//* Arguments *//
var caster;

caster = argument0;

//* Main Body *//
// Determine the Position of the Caster
var cx, cy;

cx = lsys_caster_get_x(caster);
cy = lsys_caster_get_y(caster);

// Determine the Point List of the Caster
var points = ds_map_find_value(caster, "points");

// Remove the Caster from the System
ds_list_remove(ds_map_find_value(global.light_system, "casters"), caster);

// Destroy the Caster
ds_map_destroy(caster);

// Determine the List of Lights
var lights = ds_map_find_value(global.light_system, "lights");

// Determine which Lights need to be Updated
for(var i = 0; i < ds_list_size(lights); i++)
{
    // Determine the Current Light
    var light = ds_list_find_value(lights, i);

    // Determine the Position of the Light
    var lx, ly;

    lx = lsys_light_get_x(light);
    ly = lsys_light_get_y(light);

    // Determine the Radius of the Light
    var radius = lsys_light_get_radius(light);

    // Check the Position of Each Point
    for(var j = 0; j < ds_list_size(points); j++)
    {
        // Determine the Current Point
        var point = ds_list_find_value(points, j);
    
        // Determine the Actual Position of the Point
        var px, py;
    
        px = cx + lsys_caster_point_get_x(point);
        py = cy + lsys_caster_point_get_y(point);
    
        // Determine whether or not the Current Point is Inside the Light
        var distance = point_distance(px, py, lx, ly);
    
        if(distance <= radius)
        {
            ds_map_replace(light, "changed", true);
            break;
        }
    }
}

// Mark the Light System as Changed
ds_map_replace(global.light_system, "changed", true);

#define ds_list_remove
//* Description *//
// Usage: ds_list_remove(list, value);
// Function: Removes the specified Value from the specified List
// Arguments:
// 1) list : ds_list - The ID of the specified List
// 2) value : any - The specified Value to Remove

//* Arguments *//
var list, value;

list = argument0;
value = argument1;

//* Main Body *//
// Determine the Index of the specified Value
var index = ds_list_find_index(list, value);

// Remove the specified Value
ds_list_delete(list, index);

// Return the Index of the Value
return index;
