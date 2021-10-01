/// @description Read save_data from file and populate ds_map

//If save file cannot be found, DO NOT continue; if it attempts to load a file it cannot find, it will crash
if(!file_exists(save_file)) {
	show_error("Save File could not be found!", false);
	exit;
}

//Read save_data from file
save_data = ds_map_secure_load(save_file);