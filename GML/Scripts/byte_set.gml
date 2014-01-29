//* Description *//
// Usage: byte_set(byte, index, bit);
// Function: Sets the specified Binary Integer from the specified Byte
// Arguments:
// 1) byte : int - The specified Byte (0 - 255)
// 2) index : int - The index within the Byte (0 - 3)
// 3) bit : boolean - The specified Binary Integer (0 - 1)

//* Arguments *//
var byte, index, bit;

byte = int(argument0);
index = int(argument1);
bit = bool(argument2);

//* Main Body *//
// Check for Change
if(byte_get(byte, index) == bit)
    return byte;

// Get the Position Bit
var position = power(2, index);

// Return the new Byte
if(bit)
    return byte - position;
else //!bit
    return byte + position;
