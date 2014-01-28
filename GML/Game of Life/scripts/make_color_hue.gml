//* Description *//
// Arguments: hue : int, scale : double
// Description: Creates a Color from a Hue

//* Arguments *//
var hue, scale, red, green, blue, color;

hue = argument0;
scale = argument1;
color = make_color_hsv(hue, 255, 255);

red = color_get_red(color);
green = color_get_green(color);
blue = color_get_blue(color);

return make_color_rgb(red*scale, green*scale, blue*scale);
