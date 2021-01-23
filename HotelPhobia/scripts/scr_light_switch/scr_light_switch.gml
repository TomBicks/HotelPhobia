/// @function		scr_light_switch();
/// @description	Turn the target light object on or off depending on if the switch is on or off

switch_on = !switch_on; //Toggle switch's on/off state

if(instance_exists(target)) {
	target.light_on = switch_on; //Toggle the target light's on/off state
}