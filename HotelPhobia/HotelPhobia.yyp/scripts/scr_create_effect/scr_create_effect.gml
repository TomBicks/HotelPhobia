/// @function							scr_create_effect(effect_name);
/// @param {string}		effect_name		The name of the desired screen effect, represented by a string
/// @description						Create a screen effect, e.g. Fade In or Out
function scr_create_effect(_effect_name){
	switch(_effect_name) {
		case("fade_out"):
			var _obj_fade = instance_create_depth(0, 0, -100, obj_fade);
			_obj_fade.
			show_debug_message("Fade Out screen effect created.");
			break;
		case("fade_in"):
			show_debug_message("Fade In screen effect created.");
			break;
		default:
			show_debug_message("Effect Name is not recognised!");
			break;
	}
}