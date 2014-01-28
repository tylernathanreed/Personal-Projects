//* Description *//
// Arguments: xx : int, yy : int, size : int, c_cell : color;

//* Arguments *//
var xx, yy, size, c_cell, hue, sat, val, alpha, c_old;

xx = argument0;
yy = argument1;
size = argument2;
c_cell = argument3;

hue = color_get_hue(c_cell);
sat = color_get_saturation(c_cell);
val = color_get_value(c_cell);
alpha = 1;

//* Colors *//
var c_outline, c_dark, c_light, c_glare;

if(val - 160 > 0)
    c_outline = make_color_hsv(hue, sat, val-160);
else
    c_outline = make_color_hsv(hue, sat, 0);

if(val - 96 > 0)
    c_dark = make_color_hsv(hue, sat, val-96);
else
    c_dark = make_color_hsv(hue, sat, 0);

if(val + 32 < 255)
    c_light = make_color_hsv(hue, sat, val+32);
else
    c_light = make_color_hsv(hue, sat - val + 224, 255);

if(val + 96 < 255)
    c_glare = make_color_hsv(hue, sat, val+160);
else
    c_glare = make_color_hsv(hue, sat - val + 160, 255);

//* Draw Cell *//
c_old = draw_get_color();
draw_set_alpha(alpha);
draw_set_color(c_outline);
draw_rectangle(xx + size*0/8, yy + size*0/8, xx + size*8/8, yy + size*8/8, false); // Outline Color

draw_set_color(c_dark);
draw_rectangle(xx + size*1/8, yy + size*1/8, xx + size*7/8, yy + size*7/8, false); // Dark Color

draw_set_color(c_cell);
draw_rectangle(xx + size*1/8, yy + size*1/8, xx + size*6/8, yy + size*6/8, false); // Main Color

draw_set_color(c_light);
draw_rectangle(xx + size*1/8, yy + size*1/8, xx + size*5/8, yy + size*5/8, false); // Light Color

draw_set_color(c_glare);
draw_rectangle(xx + size*2/8, yy + size*2/8, xx + size*4/8, yy + size*4/8, false); // Glare Color

draw_set_color(c_old); // Reset Color
