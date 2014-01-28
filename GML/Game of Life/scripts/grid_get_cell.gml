//* Description *//
// Arguments: xx : int, yy: int
// Function: Return the Cell at the specified Location

//* Arguments *//
var xx, yy;

xx = argument0;
yy = argument1;

if(xx < 0 || yy < 0) // Restrict Illegal Access
    return noone;
else
    return ds_grid_get(global.grid, xx, yy);
