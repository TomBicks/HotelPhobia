/// @function		scr_monster_idle_basic();
/// @description	Cause the monster to stop and/or look around

//DEBUG CODE!!
if(alarm_get(0) > 0) { image_blend = c_orange; }

counter += 1;
//Check if monster should select a new action
if(counter >= room_speed * action_duration) {
	var change = choose(0,1);
	switch(change) {
		case 0: 
			//If Seek Alarm is currently on, seek rather than wander
			if(alarm_get(0) > 0) { ai_state = monster_states.seek; }
			else { ai_state = monster_states.wander; }
		case 1: 
			counter = 0;
			dir_facing = choose(-1,1);
			action_duration = irandom_range(action_duration_min,action_duration_max);
			break;
	}
}

//Check if player spotted
if(collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*sight_max),y,obj_player,false,true)) {
	alarm_set(0,-1); //Turn Off Seek Alarm
	ai_state = monster_states.chase;
}