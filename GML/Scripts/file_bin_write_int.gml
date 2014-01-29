//* Description *//
// Usage: file_bin_write_int(file, number)
// Function: Writes the specified Integer to the specified Binary File
// Arguments:
// 1) file : int - The File ID of the specified File
// 2) number : int - The Integer to Write to the specified File

//* Arguments *//
var file, number;

file = argument0;
number = int(argument1);

//* Main Body *//
// Write each Byte to the File
for(var i = 0; i < 4; i++)
    file_bin_write_byte(file, int_get_byte(number, i));
