/// @function						scr_light_switch(switch_on, target);
/// @param {bool}	switch_on		Whether the light switch object is currently on or not
/// @param {id}		target			The light object the switch turns on and off
/// @description					Turn the target light object on or off depending on if the switch is on or off

/*#region //Set script arguments to local variables
//Whether the switch is on or not
var switch_on = argument0;

//Which light is the target of the switch
var target = argument1;
#endregion*/

switch_on = !switch_on; //Toggle switch's on/off state

//Check if the switch has a target light and if so, toggle both the switch and the light's on/off states
if(instance_exists(target)) {
	target.light_on = switch_on; //Set light's on/off state to match the switch's
}
//ERROR!! This doesn't actually affect the light in any way, even though it should