/// @function		scr_light_switch();
/// @description	Turn the target light object on or off depending on if the switch is on or off
function scr_light_switch() {

switch_on = !switch_on; //Toggle switch's on/off state

audio_play_sound(snd_switch_click, 0, false); //Play switch click sound (no emitter, as switch is next to player)

//Toggle the target light's on/off state
if(instance_exists(target)) { target.light_on = switch_on; }

}
