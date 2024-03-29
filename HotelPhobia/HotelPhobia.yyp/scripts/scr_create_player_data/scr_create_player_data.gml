/// @function						scr_create_player_data(player_x, player_y, current_room);
/// @param {real}	player_x		The X coordinate of the player
/// @param {real}	player_y		The Y coordinate of the player
/// @param {string}	current_room	The current room the player is in
/// @description					Generate a ds_grid containing the player data to be saved to file
function scr_create_player_data(_player_x, _player_y, _current_room) {

#region //Create array and populate with player data
var _player_array = array_create(data_player.column_count, -1);

_player_array[data_player.x] = _player_x;
_player_array[data_player.y] = _player_y;
_player_array[data_player.current_room] = _current_room;
#endregion

return _player_array;

}