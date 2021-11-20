/// @function								scr_save_env_obj_data(player_x, player_y, current_room);
/// @param {object_index}	object			The object_index to be iterated through to save/update the state of each
/// @param {variable}		object_state	The state to be saved/updated
/// @description							Save the specified state of all of a specified object within the room to ds_

#region //Set arguments to local variables
//The object_index to be iterated through to save/update the state of each
var _object = argument0;

//The state to be saved/updated
var _object_state = argument1;
#endregion

if(object_exists(_object)) {
	with(_object) {
		//Define unique string for the light object
		var _identifier = object_get_name(object_index) + room_get_name(room) + string(x) + string(y);
		
		//Obtain reference to the env_obj_data list
		var _env_obj_data = other.env_obj_data;
		
		//Check if object has already been encountered and added to the map
		var _result = ds_map_find_value(_env_obj_data, _identifier);
		
		//If object is already in the map, update its state
		if(!is_undefined(_result)) {
			ds_map_replace(_env_obj_data, _identifier, _object_state);
			show_debug_message("Object" + _identifier + " already encountered; updating state");
		}
		//If object is not in the map, add its identifier and state to the map
		else {
			ds_map_add(_env_obj_data, _identifier, _object_state);
			show_debug_message("Object " + _identifier + " encountered for first time; adding to map");
		}
	}
}