/// @function							scr_save_env_obj_data(object_state);
/// @param {string}		object_state	The name of the variable state to be saved/updated
/// @description						Save or update the specified state of a specified object within the room to a ds_map
function scr_save_env_obj_data(_object_state) {

#region //Identify object and whether it is in the map
//Define unique string for the environmental object
var _identifier = scr_get_identifier(self);

//Obtain reference to the env_obj_data ds_map where the states are stored
var _env_obj_data = obj_data_manager.env_obj_data;

//Check if object has already been encountered and added to the map
var _result = ds_map_find_value(_env_obj_data, _identifier);
#endregion

#region //Set arguments to local variables
//The state to be saved/updated (will return undefined if no such variable exists with the object)
var _state_variable = variable_instance_get(self.id, _object_state)
		
//Check the object_state variable exists, otherwise the game will crash anyway
if(is_undefined(_state_variable)) {
	show_error("Error: Object '" + _identifier + "'s specified state does not exist to be saved or updated!", true);
}
#endregion

#region //Save or update the object's state to ds_map
//If object is already in the map, update its state
if(!is_undefined(_result)) {
	ds_map_replace(_env_obj_data, _identifier, _state_variable);
	show_debug_message("Object" + _identifier + " already encountered; updating state");
}
//If object is not in the map, add its identifier and state to the map
else {
	ds_map_add(_env_obj_data, _identifier, _state_variable);
	show_debug_message("Object " + _identifier + " encountered for first time; adding to map");
}
#endregion

}