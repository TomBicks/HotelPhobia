/// @description Save Environmental Object Data on leaving room

#region //Update or add state of environmental object
	#region //Save states of all lights in the room
	with(obj_light_parent) {
		//Define unique string for the light object
		var _identifier = object_get_name(object_index) + room_get_name(room) + string(x) + string(y);
		
		//Obtain reference to the env_obj_data list
		var _env_obj_data = other.env_obj_data;
		
		//Check if object has already been encountered and added to the map
		var _result = ds_map_find_value(_env_obj_data, _identifier);
		
		//If object is already in the map, update its state
		if(!is_undefined(_result)) {
			ds_map_replace(_env_obj_data, _identifier, light_on);
			show_debug_message("Object" + _identifier + " already encountered; updating state");
		}
		//If object is not in the map, add its identifier and state to the map
		else {
			ds_map_add(_env_obj_data, _identifier, light_on);
			show_debug_message("Object " + _identifier + " encountered for first time; adding to map");
		}
	}
	//NOTE!! Add each of the identifier to a list, pass this list as a lcoal variable to this data manager, then go through the list and add them to the map, with their states as well???
	//Would passing a lsit work or would it duplicate?
	//Is it better to leave it as I do with the item pickups>
	//Is it better to change the item pickups to work like this if this is successful?
	//Which is better???
	#endregion
	#region //Save states of all lights in the room
	with(obj_light_switch) {
		//Define unique string for the light object
		var _identifier = object_get_name(object_index) + room_get_name(room) + string(x) + string(y);
		
		//Obtain reference to the env_obj_data list
		var _env_obj_data = other.env_obj_data;
		
		//Check if object has already been encountered and added to the map
		var _result = ds_map_find_value(_env_obj_data, _identifier);
		
		//If object is already in the map, update its state
		if(!is_undefined(_result)) {
			ds_map_replace(_env_obj_data, _identifier, switch_on);
			show_debug_message("Object" + _identifier + " already encountered; updating state");
		}
		//If object is not in the map, add its identifier and state to the map
		else {
			ds_map_add(_env_obj_data, _identifier, switch_on);
			show_debug_message("Object " + _identifier + " encountered for first time; adding to map");
		}
	}
	#endregion
#endregion