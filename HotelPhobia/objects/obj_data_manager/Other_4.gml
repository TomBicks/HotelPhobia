/// @description Load Environmental Object Data on entering room

#region //Obtain states of all lights in the room
with(obj_light_parent) {
	//Define unique string for the light object
	var _identifier = object_get_name(object_index) + room_get_name(room) + string(x) + string(y);
		
	//Obtain reference to the env_obj_data list
	var _env_obj_data = other.env_obj_data;
		
	//Check if object has already been encountered and added to the map
	var _result = ds_map_find_value(_env_obj_data, _identifier);
		
	//If object is already in the map, update its state
	if(!is_undefined(_result)) {
		light_on = _result;
		show_debug_message("Object" + _identifier + " state found; loading state");
	}
}
#endregion