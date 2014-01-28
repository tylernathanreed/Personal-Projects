//* Description *//
// Arguments: xx : int, yy : int
// Function: Returns the Neighbor Count of the Cell

//* Arguments *//
var xx, yy, count, i, j;

xx = argument0;
yy = argument1;
count = 0;

for(i = -1; i <= 1; i += 1) // Loop from Left to Right
    for(j = -1; j <= 1; j += 1) // Loop from Top to Bottom
        if(i == 0 && j == 0) // Skip Self
            continue;
        else if(grid_cell_exists(xx + i, yy + j))
            count += 1;

return count;
