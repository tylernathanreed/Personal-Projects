//* Description *//
// Usage: int_set_byte(number, index, byte)
// Function: Sets the specified Byte in the specified Integer
// Arguments:
// 1) number : int - The specified Integer
// 2) index : int - The specified Byte Index (0 - 3)
// 3) byte : int - The specified Byte (0 - 255)

//* Arguments *//
var number, index, byte;

number = int(argument0);
index = 3 - clamp(int(argument1), 0, 3);
byte = clamp(int(argument2), 0, byte_max);

//* Main Body */
// Set the specified Byte in the specified Integer
return number | (byte  << (index * 8));
