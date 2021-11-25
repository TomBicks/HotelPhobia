/// @description Load Environmental Object Data on entering room

#region //Load states of all lights in the room
with(obj_light_parent) {
	//Define unique string for the light object
	var _identifier = scr_get_identifier(self);
		
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

#region //Load states of all light switches in the room
with(obj_light_switch) {
	//Define unique string for the light switch object
	var _identifier = scr_get_identifier(self);
		
	//Obtain reference to the env_obj_data list
	var _env_obj_data = other.env_obj_data;
		
	//Check if object has already been encountered and added to the map
	var _result = ds_map_find_value(_env_obj_data, _identifier);
		
	//If object is already in the map, update its state
	if(!is_undefined(_result)) {
		switch_on = _result;
		show_debug_message("Object" + _identifier + " state found; loading state");
	}
}
#endregion