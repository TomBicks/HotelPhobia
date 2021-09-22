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
player_array = array_create(3, -1);

player_array[0] = player_x;
player_array[1] = player_y;
player_array[2] = current_room;
#endregion

return player_array;