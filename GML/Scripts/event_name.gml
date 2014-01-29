//* Description *//
// Usage: event_name(ev_type, ev_number);
// Function: Returns the Event Name from the Event Type and Number
// Arguments:
// 1) ev_type : int - The Event ID of the specified Event
// 2) ev_number : int - The Sub-Event ID of the specified Event

//* Arguments *//
var ev_type, ev_number;

ev_type = argument0;
ev_number = argument1;

//* Main Body *//
// Check through all Events
switch(ev_type)
{
    case ev_alarm:
        return "Alarm " + string(ev_number);
    case ev_collision:
        return "Collision (" + object_get_name(ev_number) + ")";
    case ev_create:
        return "Create";
    case ev_destroy:
        return "Destroy";
    case ev_draw:
        switch(ev_number)
        {
            case ev_gui:
                return "Draw | GUI";
            default:
                return "Draw";
        }

    case ev_keyboard:
    case ev_keypress:
    case ev_keyrelease:
    {
        var prefix = "Keyboard Other";

        if(ev_type == ev_keyboard)
            prefix = "Keyboard";
        else if(ev_type == ev_keypress)
            prefix = "Keyboard Press";
        else if(ev_type == ev_keyrelease)
            prefix = "Keyboard Release";

        switch(ev_number)
        {
            case vk_add:
                return prefix + " | Add";
            case vk_alt:
                return prefix + " | Alt";
            case vk_anykey:
                return prefix + " | Any Key";
            case vk_backspace:
                return prefix + " | Backspace";
            case vk_control:
                return prefix + " | Control";
            case vk_decimal:
                return prefix + " | Decimal";
            case vk_delete:
                return prefix + " | Delete";
            case vk_divide:
                return prefix + " | Divide";
            case vk_down:
                return prefix + " | Down";
            case vk_end:
                return prefix + " | End";
            case vk_enter:
            //case vk_return:
                return prefix + " | Enter";
            case vk_escape:
                return prefix + " | Escape";
            case vk_f1:
                return prefix + " | F1";
            case vk_f2:
                return prefix + " | F2";
            case vk_f3:
                return prefix + " | F3";
            case vk_f4:
                return prefix + " | F4";
            case vk_f5:
                return prefix + " | F5";
            case vk_f6:
                return prefix + " | F6";
            case vk_f7:
                return prefix + " | F7";
            case vk_f8:
                return prefix + " | F8";
            case vk_f9:
                return prefix + " | F9";
            case vk_f10:
                return prefix + " | F10";
            case vk_f11:
                return prefix + " | F11";
            case vk_f12:
                return prefix + " | F12";
            case vk_home:
                return prefix + " | Home";
            case vk_insert:
                return prefix + " | Insert";
            case vk_lalt:
                return prefix + " | Left Alt";
            case vk_lcontrol:
                return prefix + " | Left Control";
            case vk_left:
                return prefix + " | Left";
            case vk_lshift:
                return prefix + " | Left Shift";
            case vk_multiply:
                return prefix + " | Multiply";
            case vk_nokey:
                return prefix + " | No Key";
            case vk_numpad0:
                return prefix + " | Num 0";
            case vk_numpad1:
                return prefix + " | Num 1";
            case vk_numpad2:
                return prefix + " | Num 2";
            case vk_numpad3:
                return prefix + " | Num 3";
            case vk_numpad4:
                return prefix + " | Num 4";
            case vk_numpad5:
                return prefix + " | Num 5";
            case vk_numpad6:
                return prefix + " | Num 6";
            case vk_numpad7:
                return prefix + " | Num 7";
            case vk_numpad8:
                return prefix + " | Num 8";
            case vk_numpad9:
                return prefix + " | Num 9";
            case vk_pagedown:
                return prefix + " | Page Down";
            case vk_pageup:
                return prefix + " | Page Up";
            case vk_pause:
                return prefix + " | Pause";
            case vk_printscreen:
                return prefix + " | Print Screen";
            case vk_ralt:
                return prefix + " | Right Alt";
            case vk_rcontrol:
                return prefix + " | Right Control";
            case vk_right:
                return prefix + " | Right";
            case vk_rshift:
                return prefix + " | Right Shift";
            case vk_shift:
                return prefix + " | Shift";
            case vk_space:
                return prefix + " | Space";
            case vk_subtract:
                return prefix + " | Subtract";
            case vk_tab:
                return prefix + " | Tab";
            case vk_up:
                return prefix + " | Up";
            default:
                return prefix + " | " + chr(ev_number);
        }
    }

    case ev_mouse:
        switch(ev_number)
        {
            case ev_global_left_button:
                return "Mouse | Global Left Button";
            case ev_global_left_press:
                return "Mouse | Global Left Press";
            case ev_global_left_release:
                return "Mouse | Global Left Release";
            case ev_global_middle_button:
                return "Mouse | Global Middle Button";
            case ev_global_middle_press:
                return "Mouse | Global Middle Press";
            case ev_global_middle_release:
                return "Mouse | Global Middle Release";
            case ev_global_right_button:
                return "Mouse | Global Right Button";
            case ev_global_right_press:
                return "Mouse | Global Right Press";
            case ev_global_right_release:
                return "Mouse | Global Right Release";
            case ev_left_button:
                return "Mouse | Left Button";
            case ev_left_press:
                return "Mouse | Left Press";
            case ev_left_release:
                return "Mouse | Left Release";
            case ev_middle_button:
                return "Mouse | Middle Button";
            case ev_middle_press:
                return "Mouse | Middle Press";
            case ev_middle_release:
                return "Mouse | Middle Release";
            case ev_right_button:
                return "Mouse | Right Button";
            case ev_right_press:
                return "Mouse | Right Press";
            case ev_right_release:
                return "Mouse | Right Release";
            case ev_mouse_wheel_down:
                return "Mouse | Wheel Down";
            case ev_mouse_wheel_up:
                return "Mouse | Wheel Up";
            case ev_mouse_enter:
                return "Mouse | Enter";
            case ev_mouse_leave:
                return "Mouse | Leave";
            default:
                return "Mouse";
        }
    case ev_step:
        switch(ev_number)
        {
            case ev_step_begin:
                return "Step | Begin";
            case ev_step_end:
                return "Step | End";
            case ev_step_normal:
                return "Step | Normal";
            default:
                return "Step";
        }
    case ev_other:
        switch(ev_number)
        {
            case ev_animation_end:
                return "Other | Animation End";
            case ev_boundary:
                return "Other | Bounadary";
            case ev_close_button:
                return "Other | Close Button";
            case ev_end_of_path:
                return "Other | End of Path";
            case ev_game_end:
                return "Other | Game End";
            case ev_game_start:
                return "Other | Game Start";
            case ev_no_more_health:
                return "Other | No More Health";
            case ev_no_more_lives:
                return "Other | No More Lives";
            case ev_outside:
                return "Other | Outside";
            case ev_room_end:
                return "Other | Room End";
            case ev_room_start:
                return "Other | Room Start";
            case ev_user0:
                return "Other | User 0";
            case ev_user1:
                return "Other | User 1";
            case ev_user2:
                return "Other | User 2";
            case ev_user3:
                return "Other | User 3";
            case ev_user4:
                return "Other | User 4";
            case ev_user5:
                return "Other | User 5";
            case ev_user6:
                return "Other | User 6";
            case ev_user7:
                return "Other | User 7";
            case ev_user8:
                return "Other | User 8";
            case ev_user9:
                return "Other | User 9";
            case ev_user10:
                return "Other | User 10";
            case ev_user11:
                return "Other | User 11";
            case ev_user12:
                return "Other | User 12";
            case ev_user13:
                return "Other | User 13";
            case ev_user14:
                return "Other | User 14";
            case ev_user15:
                return "Other | User 15";
            default:
                return "Other";
        }
    case ev_trigger:
        return "Trigger " + string(event_number);
    default:
        return "Unknown";
}
