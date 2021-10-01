/// @function						scr_create_player_data(player_x, player_y, current_room);
/// @param {real}	player_x		The X coordinate of the player
/// @param {real}	player_y		The Y coordinate of the player
/// @param {string}	current_room	The current room the player is in
/// @description					Generate a ds_grid containing the player data to be saved to file

#region //Set arguments to local variables
//X & Y coordinates of the player
var player_x = argument0;
var player_y = argument1;

//The name of the room the player is currently in
var current_room = argument2;
#endregion

#region //Create array and populate with player data
player_array = array_create(data_player.column_count, -1);

player_array[data_player.x] = player_x;
player_array[data_player.y] = player_y;
player_array[data_player.current_room] = current_room;
#endregion

return player_array;