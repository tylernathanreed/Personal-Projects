//* Description *//
// Usage: echo(source, message);
// Function: Prints the specified String to the Console in Debug Mode
// Arguments:
// 1) source : int - The Instance ID of the Source Instance calling the Echo
// 1) message : string - The specified Message

//* Arguments *//
var source, message;

source = argument0;
message = string(argument1);

//* Main Body *//
// Determine the String Prefix
var prefix = "[Debug] ";

// Look for Instance within Script Origin
if(source == self)
    source = self.id;
else if(source == other)
    source = other.id;

if(instance_exists(source))
    prefix = "[" + string(object_get_name(source.object_index)) + " | " +
                   string(source.id) + " | " +
                   event_name(event_type, event_number) + "] ";

// Check for Debug Mode
if(debug_mode)
    show_debug_message(prefix + message);
