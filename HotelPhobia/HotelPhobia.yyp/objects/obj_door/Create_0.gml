//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
unlocked = false; //Is the door unlocked? *INCLUDED IN ENV_OBJ_DATA*
target_room = -1; //The room the door leads to
target_x = 0; //The x coord of the location the door leads to
target_y = 0; //The y coord of the location the door leads to

goto_delay = 4; //Delay before game goes to the next room (to allow for fade out to occur)
fade_out_speed_needed = 1/goto_delay; //Speed at which the game fades out to black after interacting with a door; proportional to goto delay (4 tick delay means 25% (0.25) to black each tick

//Define script to run when object is interacted with
behaviour = scr_door;
