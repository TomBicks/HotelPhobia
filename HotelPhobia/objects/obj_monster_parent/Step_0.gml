/// @description AI States Logic
//Tutorial found https://www.youtube.com/watch?v=DYkJ91eg67Y

//DEBUG CODE!!
image_blend = c_white;

if(ai_state == monster_states.idle) {
	#region // Idle State Logic
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
	#endregion
}

else if(ai_state == monster_states.wander) {
	#region // Wander State Logic
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
	#endregion
}

else if(ai_state == monster_states.seek) {
	#region // Seek State Logic
	//DEBUG CODE!!
	image_blend = c_orange;
	
	if(seek_x != -1) {
		//Set monster to idle when it reaches the approximate seek location
		if(x >= (seek_x - seek_speed) && x < (seek_x + seek_speed)) {
			seek_x = -1;
			ai_state = monster_states.idle;
		}
	}
	else {
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
	}
	
	//If Seek Alarm triggers before the mosnter finds the player, return to wandering
	if(alarm_get(0) <= 0 ) { 
		alarm_set(0,-1); //Turn Off Seek Alarm
		ai_state = monster_states.idle; 
	}
	
	//Check if player spotted
	if(collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*sight_max),y,obj_player,false,true)) {
		alarm_set(0,-1); //Turn Off Seek Alarm
		ai_state = monster_states.chase;
	}
	
	//Move towards the seek location
	//x += sign(seek_x-x) * seek_speed;
	x += dir_facing * seek_speed;
	#endregion
}

else if(ai_state == monster_states.chase) {
	#region // Chase State Logic
	//DEBUG CODE!!
	image_blend = c_red;

	//Monster always faces player whilst in a chase
	dir_facing = sign(obj_player.x-x);

	//If the player is in range for the monster to attack
	if(collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*attack_range),y,obj_player,false,true)) {
		ai_state = monster_states.attack;
	}
	
	//If player escapes sight, monster starts seeking at last place they saw
	if(!collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*sight_max),y,obj_player,false,true)) {
		seek_x = obj_player.x;
		alarm_set(0, room_speed * seek_search_time);
		ai_state = monster_states.seek;
	}
	
	//Chase the player
	x += dir_facing * seek_speed;
	#endregion
}

else if(ai_state == monster_states.attack) {
	#region // Attack State Logic
	//DEBUG CODE!!
	image_blend = c_maroon;
	
	//Spawn attack object
	//NOTE!! NEED TO MAKE THIS SPAWN ONLY ONCE!!
	//instance_create_depth(x,y,0,attack_object);
	
	counter += 1;
	if(counter > room_speed*attack_duration) { 
		counter = 0;
		ai_state = monster_states.chase;
	}
	#endregion
}

else if(ai_state == monster_states.leaving) {
	#region // Leaving State Logic
	//UNIMPLEMENTED!!
	
	//DEBUG CODE!!
	image_blend = c_gray;
	
	//Move towards the exit door, then either teleport back to origin room or delete and new instance in origin room
	//Turn off Leaving Alarm
	if(is_leaving) { alarm_set(1, -1); }
	//NOTE!! This is mainly handled by the monster controller, most likely
	#endregion
}

//Set sprite to reflect current state and direction
sprite_index = sprite_array[ai_state];
image_xscale = sign(dir_facing);