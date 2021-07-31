/// @description Insert description here

//Define the enumerator that the monster AI uses as states;
//Idle is standing still, wander is moving without aggro, 
//seek is moving after hearing something, chase is seeing the player and chasing them
//attack is the beginning to end of an attack before going back to chase
enum monster_states {
	idle,
	wander,
	seek,
	chase,
	attack
}

sprite_array[monster_states.idle] = spr_monster_idle;
sprite_array[monster_states.wander] = spr_monster_run;
sprite_array[monster_states.seek] = spr_monster_run;
sprite_array[monster_states.chase] = spr_monster_run;
sprite_array[monster_states.attack] = spr_monster_run;

//Create initial variables and their values
sight_range = 50; //How far the monster can see
wander_speed = 1; //How fast the monster can wander
chase_speed = 2 //How fast the monster can chase

ai_state = monster_states.idle; //The initial state the monster starts in
action_delay = 3; //The time in seconds between actions, whether this be to stop, move or turn
seek_time = 10; //The time in seconds the monster spends looking for the player after losing sight of them

counter = 0;
dir_facing = -1;