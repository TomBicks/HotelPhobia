/// @description Write save_data to file from ds_map
//Update save_data ds_map with new values

#region //Create array and populate with player data
player_data = scr_create_player_data(obj_player.x, obj_player.y, room);
ds_map_replace(save_data, "player data", player_data);
#endregion

#region //Create ds_grid and populate with encountered item data

#endregion

//Write save_data to file
ds_map_secure_save(save_data, "save_data.dat");
show_message("Game Saved.");