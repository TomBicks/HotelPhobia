/// @description AI States Logic
//Tutorial found https://www.youtube.com/watch?v=DYkJ91eg67Y

if(ai_state == monster_states.idle) {
	#region // Idle State Logic
	counter += 1;

	if(counter >= room_speed * action_delay) {
		var change = choose(0,1);
		switch(change) {
			case 0: 
				ai_state = monster_states.wander;
				//dir_facing = choose(-1,1);
			case 1: 
				counter = 0; 
				action_delay = irandom_range(2,4);
				break;
		}
	}
	#endregion
}

else if(ai_state == monster_states.wander) {
	#region // Wander State Logic
	counter += 1;
	x += dir_facing * move_speed;

	if(counter >= room_speed * action_delay) {
		var change = choose(0,1);
		switch(change) {
			case 0: 
				ai_state = monster_states.idle;
			case 1: 
				dir_facing = choose(-1,1);
				counter = 0; 
				action_delay = irandom_range(2,4);
				break;
		}
	}

	image_xscale = sign(dir_facing);
	#endregion
}