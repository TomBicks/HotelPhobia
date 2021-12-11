/// @function								scr_effect_fade(fade_out_speed,fade_in_speed,fade_color);
/// @param {float}		fade_out_speed		The name of the desired screen effect, represented by a string
/// @param {float}		fade_in_speed		The name of the desired screen effect, represented by a string
/// @param {color}		fade_color			The name of the desired screen effect, represented by a string
/// @description							Create a screen effect, e.g. Fade In or Out
function scr_effect_fade(_fade_out_speed,_fade_in_speed,_fade_color) {
	//Create an isntance of obj_effect_fade and give it the properties defined in the parameters of the script
	var _obj = instance_create_depth(0, 0, -100, obj_effect_fade);
	_obj.fade_out_speed = _fade_out_speed;
	_obj.fade_in_speed = _fade_in_speed;
	_obj.fade_color = _fade_color;
}