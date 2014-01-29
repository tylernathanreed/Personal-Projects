//* Description *//
// Usage: byte_create_from_bits(bit[0], bit[1], bit[2], bit[3], bit[4], bit[5], bit[6], bit[7]);
// Function: Returns a Byte constructed from the specified Bits
// Arguments:
// 1) bit[] : int - The specified Bits (0 - 1)

//* Arguments *//
var bit;

for(var i = 0; i < 8; i++)
    bit[i] = bool(argument[i]);

// Main Body *//
// Construct the Byte
var byte = 0;

for(var i = 0; i < 8; i++)
    byte += bit[i] << (7 - i);

// Return the Constructed Byte
return byte;
