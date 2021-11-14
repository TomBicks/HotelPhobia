/// @description Initialise save_data by reading from file and populate ds_map

save_file = "save_data.dat";

//Read save data from file and create a ds_map to hold this
save_data = ds_map_secure_load(save_file);

#region //Define unique data enumerators for data structures with multiple entries/columns
/*The 'column_count' on each enumerator is a quick and scaleable way of telling 
how many rows a data structure needs to fit each lot of data*/

enum data_player {
	x,
	y,
	current_room,
	column_count
}
#endregion

#region //Create individual data structures for each subset of data that is used during runtime
//Create map for items encountered in the environment, being either on the ground or picked up
env_item_data = ds_map_create();

//Create map for mundane objects encountered in the environment, such as light switches being on or off
env_obj_data = ds_map_create();
#endregion