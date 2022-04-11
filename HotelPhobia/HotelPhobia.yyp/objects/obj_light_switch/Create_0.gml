//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
switch_on = false; //Is the switch activated and the output on?
target = -1; //By default no target light is elected

#region //Define script to run when object is interacted with
behaviour = function scr_light_switch() {
	//Toggle switch's on/off state
	switch_on = !switch_on; 

	//Play switch click sound (no emitter, as switch is next to player)
	audio_play_sound(snd_switch_click, 0, false);

	//Toggle the target light's on/off state
	if(instance_exists(target)) { target.light_on = switch_on; }
}
#endregion