/// @function					scr_save_data(player_x, player_y, current_room);
/// @param {id}		data		The data to be saving to save data
/// @param {string}	data_key	The key the data is saved under un the save_data ds_map
/// @description				Save data to save_data ds_map, checking whether to replace or add new data

#region //Set arguments to local variables
//The data to be saving to save data
var data = argument0;

//The key the data is saved under un the save_data ds_map
var data_key = argument1;
#endregion

//If data already exists in the save data, replace it with the new data
if(!is_undefined(ds_map_find_value(save_data, data_key))) {
	ds_map_replace(save_data, data_key, data);
}
//Else, add data to the save data
else {
	ds_map_add(save_data, data_key, data);
}