/// @description Initialise save_data by reading from file and populate ds_map
//Read save data from file and create a ds_map to hold this
save_data = ds_map_secure_load("save_data.dat");

#region //Define unique data enumerators
/*The 'column_count' on each enumerator is a quick and scaleable way of telling 
how many rows a data structure needs to fit each lot of data*/

enum data_player {
	x,
	y,
	current_room,
	column_count
}

enum data_items {
	taken
}
#endregion