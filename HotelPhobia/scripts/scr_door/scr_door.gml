/// @function		scr_door();
/// @description	Enter door, if unlocked, and exit through target door

if(!unlocked || target_room = -1) {
	audio_play_sound(snd_door_locked, 0, false);
} else {
	audio_play_sound(snd_door_open, 0, false);
	
	room_goto(target_room);
}

/*NOTE!! Need to make it  that the target_x and target_y coords are passed through and somehow make
the player object appear at those coords (can't place the obj_player in the rooms beforehand)*/
