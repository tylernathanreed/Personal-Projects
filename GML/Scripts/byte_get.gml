//* Description *//
// Usage: byte_get(byte, index);
// Function: Returns the specified Binary Integer from the specified Byte
// Arguments:
// 1) byte : int - The specified Byte (0 - 255)
// 2) index : int - The index within the Byte (0 - 3)

//* Arguments *//
var byte, index;

byte = int(argument0);
index = int(argument1);

//* Main Body *//
// Remove other Bits from the Byte
byte &= power(2, index);

// Return the Value of the Bit
return sign(byte);
