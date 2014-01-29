//* Description *//
// Usage: byte_get_bit(byte, index);
// Function: Returns the specified Binary Integer from the specified Byte
// Arguments:
// 1) byte : int - The specified Byte (0 - 255)
// 2) index : int - The index within the Byte (0 : Left - 7 : Right)

//* Arguments *//
var byte, index;

byte = clamp(int(argument0), 0, byte_max);
index = 7 - clamp(int(argument1), 0, 7);

//* Main Body *//
// Remove other Bits from the Byte
byte &= power(2, index);

// Return the Value of the Bit
return sign(byte);
