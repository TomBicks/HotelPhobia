/// @description Write save_data to file from ds_map
//Update save_data ds_map with new values

//TODO!!! BOTH THESE SAVING PROCESSES ARE IDENTICAL; MAKE IT INTO A SCRIPT AND FEED IT THE ARGUMENTS!!

#region //Populate ds_map with player data and add to save data
player_data = scr_create_player_data(obj_player.x, obj_player.y, room);
scr_save_data(player_data, "player_data");
#endregion

#region //Add environmental item data to save data
scr_dave_data(env_item_data, "env_item_data");
#endregion

#region //Create ds_grid and populate with environmental object data
//stuff like light switches and lights whether they were on or off between rooms
#endregion

//Write save_data to file
ds_map_secure_save(save_data, "save_data.dat");
show_message("Game Saved.");