//* Description *//
// Usage: int_create_from_bytes(byte[0], byte[1], byte[2], byte[3]);
// Function: Returns an Integer constructed from the specified Bytes
// Arguments:
// 1) byte[] : int - The specified Bytes (0 - 255)

//* Arguments *//
var byte;

for(var i = 0; i < 4; i++)
    byte[i] = clamp(int(argument[i]), 0, byte_max);

//* Main Body *//
// Construct the Integer
var integer = 0;

for(var i = 0; i < 4; i++)
    integer += byte[i] << ((3 - i) * 8);

// Return the Constructed Integer
return integer << 0;
