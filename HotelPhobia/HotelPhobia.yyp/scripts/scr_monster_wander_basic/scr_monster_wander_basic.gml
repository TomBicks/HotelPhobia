/// @function		scr_monster_wander_basic();
/// @description	Cause the monster to slowly wander around
function scr_monster_wander_basic() {

counter += 1;
//Check if monster should select a new action
if(counter >= room_speed * action_duration) {
	var change = choose(0,1);
	switch(change) {
		case 0: 
			ai_state = monster_states.idle;
		case 1: 
			counter = 0;
			dir_facing = choose(-1,1);
			action_duration = irandom_range(action_duration_min,action_duration_max);
			break;
	}
}

//Check if player spotted
if(collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*sight_max),y,obj_player,false,true)) {
	counter = 0;
	alarm_set(0,-1); //Turn Off Seek Alarm
	ai_state = monster_states.chase;
}

//Wander in the direction chosen
x += dir_facing * wander_speed;

//If time to leave, enter leaving state instead of wander state
//This means the monster will still seek, but leave once seek state is finished
if(is_leaving) { ai_state = monster_states.leaving; }

}