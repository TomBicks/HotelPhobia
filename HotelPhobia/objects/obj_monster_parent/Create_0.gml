/// @description Insert description here

#region //Define the enumerator  the monster AI state machine uses
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
#endregion

#region //Create array used to store sprites used for each state
sprite_array = array_create(5,-1);
sprite_array[monster_states.idle] = spr_monster_idle;
sprite_array[monster_states.wander] = spr_monster_run;
sprite_array[monster_states.seek] = spr_monster_run;
sprite_array[monster_states.chase] = spr_monster_run;
sprite_array[monster_states.attack] = spr_monster_run;
#endregion

//Create initial variables and their values
sight_range = 100; //How far the monster can see
wander_speed = 0.5; //How fast the monster can wander
chase_speed = 1 //How fast the monster can chase

ai_state = monster_states.idle; //The initial state the monster starts in
wander_time = 3; //The time in seconds spent idle or wandering

seek_time = 10; //The time in seconds the monster spends looking for the player after losing sight of them
seek_x = 0; //The x-coord of the location the monster is seeking; either where a noise was heard of the last place a player was seen

counter = 0;
dir_facing = -1;