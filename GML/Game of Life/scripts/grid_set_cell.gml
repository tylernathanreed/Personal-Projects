//* Description *//
// Arguments: xx : int, yy: int, cell : obj_cell
// Function: Set the Cell at the specified Index

//* Arguments *//
var xx, yy, cell;

xx = argument0;
yy = argument1;
cell = argument2;

if(xx < 0 || yy < 0) // Restrict Illegal Access
    exit;
else
    ds_grid_set(global.grid, xx, yy, cell);
