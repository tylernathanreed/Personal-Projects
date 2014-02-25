#define inst
//* Description *//
// Usage: inst(instance);
// Function: Returns the Instance ID given the specified Instance
// Arguments:
// 1) instance : int - The specified Instance

//* Arguments *//
var instance;

instance = int(argument0);

//* Main Body *//
// Convert Self and Other Targets
if(instance == self || instance == other)
    instance = instance.id;

// Check for Existing Instances
if(!instance_exists(instance))
    instance = noone;

// Return the Determined Instance ID
return instance;

