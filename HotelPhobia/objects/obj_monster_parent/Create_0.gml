/// @description Insert description here

#region // Define the enumerator the monster AI state machine uses
//Idle is standing still, wander is moving without aggro, 
//seek is moving after hearing something, chase is seeing the player and chasing them
//attack is the beginning to end of an attack before going back to chase
enum monster_states {
	idle,
	wander,
	seek,
	chase,
	attack,
	leaving
}
#endregion

#region // Create array used to store sprites used for each state
sprite_array = array_create(5,-1);
sprite_array[monster_states.idle] = spr_monster_idle;
sprite_array[monster_states.wander] = spr_monster_run;
sprite_array[monster_states.seek] = spr_monster_run;
sprite_array[monster_states.chase] = spr_monster_run;
sprite_array[monster_states.attack] = spr_monster_idle;
sprite_array[monster_states.leaving] = spr_monster_run;
#endregion

#region // Create initial variables and their values
counter = 0;
dir_facing = -1;
ai_state = monster_states.idle; //The initial state the monster starts in

sight_min = -20; //How close the monster can see (negative means it can see behind)
sight_max = 100; //How far the monster can see

action_duration_min = 2 //The minimum amount of time the monster can spend idle, wandering or seeking before picking a new action
action_duration_max = 4 //The maximum amount of time the monster can spend idle, wandering or seeking before picking a new action
action_duration = 0; //The time in seconds spent doing an action (idle, wandering or seeking) before picking a new action

wander_speed = 0.5; //How fast the monster can wander

seek_speed = 1 //How fast the monster can seek and chase
seek_search_time = 20; //The time in seconds the monster spends looking for the player after losing sight of them
//seek_counter = 0; //Counter showcasing how much time is left before the mosnter stops looking for the player (-1 means it won't ever stop)
seek_x = 0; //The x-coord of the location the monster is seeking; either where a noise was heard of the last place a player was seen

attack_range = 20; //The range from which a monster can attack (also the range in which it will stop persuing the player)
//attack_object = null; //The object spawned when attacking, whether this be a slash object or a projectile
attack_duration = 1; //The duration in seconds that a mosnter spends in the attack state before going back to chasing

//NOTE!! NEED TO CHECK IF THE MOSNTER IS IN THEIR ORIGIN ROOM FOR THIS TO WORK; SHOULD THIS BE ALL UP TO CONTROLLER?
is_leaving = false; //Is the monster leaving for their origin room yet
target_door = -1; //The door object through which the monster will be leaving for their origin room (passed to them by the ocntroller)
#endregion