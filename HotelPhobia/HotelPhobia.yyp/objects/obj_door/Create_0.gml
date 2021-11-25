//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
unlocked = false; //Is the door unlocked? *INCLUDED IN ENV_OBJ_DATA*
target_room = -1; //The room the door leads to
target_x = 0; //The x coord of the location the door leads to
target_y = 0; //The y coord of the location the door leads to

//Define script to run when object is interacted with
behaviour = scr_door;
