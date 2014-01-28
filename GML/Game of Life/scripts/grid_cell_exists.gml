//* Description *//
// Arguments: xx : int, yy : int
// Function: Returns whether or not a Cell exists at the specified Index

//* Arguments *//
var xx, yy;

xx = argument0;
yy = argument1;

return ds_grid_get(global.cells, xx, yy);
