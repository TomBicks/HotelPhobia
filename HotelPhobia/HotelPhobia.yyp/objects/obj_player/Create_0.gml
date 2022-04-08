/// @description Insert description here
#region // Define the enumerator the player state machine uses
//Idle is standing still
//Walk is moving left or right without holding the sprint key
//Sprint is moving left or right whilst holding down the sprint key
enum player_states {
	idle,
	walk,
	sprint
}
#endregion

#region // Create array used to store sprites used for each state
sprite_array = array_create(2,-1);
sprite_array[player_states.idle] = spr_player_idle;
sprite_array[player_states.walk] = spr_player_walk;
sprite_array[player_states.sprint] = spr_player_sprint;
#endregion

#region //Create initial variables and their values
//The initial state the player starts in
player_state = player_states.idle;

//The speed the player moves whilst walking
walk_speed = 2;
//The speed the player moves whilst sprinting
sprint_speed = 4;

//The range in pixels a player can interact with an interactable object from
interact_range = 30;
#endregion