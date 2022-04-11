//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
unlocked = false; //Is the door unlocked? *INCLUDED IN ENV_OBJ_DATA*
target_room = -1; //The room the door leads to
target_x = 0; //The x coord of the location the door leads to
target_y = 0; //The y coord of the location the door leads to

#region //Define script to run when object is interacted with
	behaviour = function scr_door() {
	if(!unlocked || target_room = -1) {
		audio_play_sound(snd_door_locked, 0, false);
	} else {
		audio_play_sound(snd_door_open, 0, false);
		scr_room_transition_fade(target_room, target_x, target_y, 0.025, 0.025, c_black);
	}
}
#endregion