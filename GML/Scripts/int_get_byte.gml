//* Description *//
// Usage: int_get_byte(number, index)
// Function: Returns the specified Byte from the specified Integer
// Arguments:
// 1) number : int - The specified Integer
// 2) index : int - The specified Byte Index (0 : Left - 3 : Right)

//* Arguments *//
var number, index;

number = argument0; // Cannot Cast to Int (Game Maker doesn't like Big Numbers)
index = 3 - clamp(int(argument1), 0, 3);

//* Main Body */
// Return the specified Byte
return (number div power(2, index * 8)) & $FF;
