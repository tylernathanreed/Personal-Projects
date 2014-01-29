//* Description *//
// Usage: file_bin_read_int(file)
// Function: Reads the next Integer from the specified Binary File
// Arguments:
// 1) file : int - The File ID of the specified File

//* Arguments *//
var file;

file = argument0;

//* Main Body *//
// Break the Integer into 4 Bytes (32 Bits)
var byte;

// Each Byte is 8 Bits
byte[0] = file_bin_read_byte(file);
byte[1] = file_bin_read_byte(file);
byte[2] = file_bin_read_byte(file);
byte[3] = file_bin_read_byte(file);

// Convert the Bytes to an Integer
var number = (byte[0] << 24) + (byte[1] << 16) + (byte[2] << 8) + (byte[3]);

// Return the Converted Integer
return number;
