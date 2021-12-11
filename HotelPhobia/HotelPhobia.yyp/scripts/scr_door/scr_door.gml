/// @function		scr_door();
/// @description	Enter door, if unlocked, and exit through target door
function scr_door() {

if(!unlocked || target_room = -1) {
	audio_play_sound(snd_door_locked, 0, false);
} else {
	audio_play_sound(snd_door_open, 0, false);
	
	scr_room_transition_fade(target_room, target_x, target_y, 0.025, 0.025, c_black);
}

}