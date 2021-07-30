/// @description Insert description here

//Define the enumerator that the monster AS uses;
//Idle is standing still, wander is moving without aggro, 
//seek is moving after hearing something, chase is seeing the player and chasing them
enum monster_states {
	idle,
	wander,
	seek,
	chase
}

sprite_array[monster_states.idle] = spr_monster_idle;
sprite_array[monster_states.wander] = spr_monster_run;
sprite_array[monster_states.seek] = spr_monster_run;
sprite_array[monster_states.chase] = spr_monster_run;

//Create initial variables and their values
sight_range = 50; //How far the monster can see
move_speed = 1; //How fast the monster can move

ai_state = monster_states.idle; //The current state the monster is in
action_delay = 3; //The delay between actions, whether this be stop, move or turn; measured in seconds

counter = 0;
dir_facing = -1;