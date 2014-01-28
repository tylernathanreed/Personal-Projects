//* Description *//
// Arguments: size : int
// Function: Resizes Cells and reconfigures Grids

//* Arguments *//
global.size = argument0;

//* Resize Grids *//
var width, height;
width = room_width/global.size;
height = (room_height-global.controller.border)/global.size;

global.controller.grid_width = width;
global.controller.grid_height = height;

ds_grid_resize(global.cells, width, height);
ds_grid_resize(global.grid, width, height);
ds_grid_resize(global.colors, width, height);

//* Move Cells *//
with(obj_cell)
{
    image_xscale = global.size/cell_size;
    image_yscale = global.size/cell_size;

    x = xx*global.size;
    y = yy*global.size;
}
