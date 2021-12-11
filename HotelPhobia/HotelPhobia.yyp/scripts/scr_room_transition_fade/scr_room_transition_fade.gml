/// @function								scr_room_transition_fade(fade_out_speed,fade_in_speed,fade_color);
/// @param {room}		target_room			The room to transition to
/// @param {int}		target_x			The x coordinate to send the player to in the next room
/// @param {int}		target_y			The y coordinate to send the player to in the next room
/// @param {real}		fade_out_speed		The speed at which the screen fades out, measured in % to fade-out per tick
/// @param {real}		fade_in_speed		The speed at which the screen fades in, measured in % to fade-in per tick
/// @param {color}		fade_color			The color to fade out and in from
/// @description							Fade out and in as the player transitions between rooms
function scr_room_transition_fade(_target_room,_target_x,_target_y,_fade_out_speed,_fade_in_speed,_fade_color) {
	
	#region //Create an object to facilitate fading out and in, as well as moving the player to the corrrect room and location
	var _obj = instance_create_depth(0, 0, -100, obj_room_transition_fade);
	
	#region //Give the object the specified fade parameters
	_obj.fade_out_speed = _fade_out_speed;
	_obj.fade_in_speed = _fade_in_speed;
	_obj.fade_color = _fade_color;
	#endregion
	
	#region //Give the object the specificed target room and coordinates
	_obj.target_room = _target_room;
	_obj.target_x = _target_x;
	_obj.target_y = _target_y;
	#endregion
	#endregion
}