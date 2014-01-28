//* Description *//
// Arguments: ID : int, width : int, height : int, alpha : double, c_button : int, c_hover : int, c_scroll : int
// Function: Changes DDM Settings (All Arguments can be set to -1 to not change the value)

//* Arguments *//
var ID, width, height, alpha, c_button, c_hover, c_scroll;

ID = argument0;
width = argument1;
height = argument2;
alpha = argument3;
c_button = argument4;
c_hover = argument5;
c_scroll = argument6;

// Change Settings
ID.adjust = false;

if(width != -1) ID.button_width = width;
if(height != -1) ID.button_height = height;
if(alpha != -1) ID.alpha = alpha;
if(c_button != -1) ID.c_button = c_button;
if(c_hover != -1) ID.c_hover = c_hover;
if(c_scroll != -1) ID.c_scroll = c_scroll;
