#define int
//* Description *//
// Usage: int(number);
// Function: Converts the specified Number to an Integer
// Arguments:
// 1) int : any - The specified Number

//* Arguments *//
var number;

number = argument0;

//* Main Body *//
// Convert the Number to an Integer
return round(real(number));

#define bool
//* Description *//
// Usage: bool(number)
// Function: Converts the specified Number to a Boolean
// Arguments:
// 1) number : any - The specified Number

//* Arguments *//
var number;

number = argument0;

//* Main Body *//
// Convert the specified Number to a Boolean
return real(number) != 0;

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

