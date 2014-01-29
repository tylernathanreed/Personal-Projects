//* Description *//
// Usage: byte_set_bit(byte, index, bit);
// Function: Sets the specified Binary Integer from the specified Byte
// Arguments:
// 1) byte : int - The specified Byte (0 - 255)
// 2) index : int - The index within the Byte (0 - 7)
// 3) bit : boolean - The specified Binary Integer (0 - 1)

//* Arguments *//
var byte, index, bit;

byte = clamp(int(argument0), 0, byte_max);
index = clamp(int(argument1), 0, 7);
bit = bool(argument2);

//* Main Body *//
// Check for Change
if(byte_get_bit(byte, index) == bit)
    return byte;

// Get the Position Bit
var position = power(2, index);

// Return the new Byte
if(bit)
    return byte - position;
else //!bit
    return byte + position;
