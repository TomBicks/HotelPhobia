/// @function		scr_light_switch();
/// @description	Turn the target light object on or off depending on if the switch is on or off


//Toggle switch's on/off state
switch_on = !switch_on;

//Play switch click sound
audio_play_sound(snd_switch_click, 0, false);

//Toggle the target light's on/off state (if one exists)
if(instance_exists(target)) {
	target.light_on = switch_on;
}