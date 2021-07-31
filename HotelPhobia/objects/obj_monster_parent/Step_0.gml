/// @description AI States Logic
//Tutorial found https://www.youtube.com/watch?v=DYkJ91eg67Y

//DEBUG!!
image_blend = c_white;

if(ai_state == monster_states.idle) {
	#region // Idle State Logic
	//Incremement counter and check if monster should select a new action
	//WAIT, WHY DOES IT MATTER CHAGING COUNTER TO 0 IN ONE OPTION; SHOULDN'T THEY BOTH HAVE COUTNER SET TO 0
	counter += 1;
	if(counter >= room_speed * action_delay) {
		var change = choose(0,1);
		switch(change) {
			case 0: 
				ai_state = monster_states.wander;
				dir_facing = choose(-1,1);
			case 1: 
				counter = 0; 
				action_delay = irandom_range(2,4);
				break;
		}
	}
	
	//Check if player spotted
	if(collision_line(x-(dir_facing*20),y,x+(dir_facing*sight_range),y,obj_player,false,true)) {
		ai_state = monster_states.chase;
	}
	#endregion
}

else if(ai_state == monster_states.wander) {
	#region // Wander State Logic
	//Incremement counter and check if monster should select a new action
	counter += 1;
	if(counter >= room_speed * action_delay) {
		var change = choose(0,1);
		switch(change) {
			case 0: 
				ai_state = monster_states.idle;
				dir_facing = choose(-1,1);
			case 1: 
				dir_facing = choose(-1,1);
				counter = 0; 
				action_delay = irandom_range(2,4);
				break;
		}
	}
	
	//Wander in the direction chosen
	x += dir_facing * wander_speed;
	
	//Check if player spotted
	if(collision_line(x-(dir_facing*20),y,x+(dir_facing*sight_range),y,obj_player,false,true)) {
		ai_state = monster_states.chase;
	}
	#endregion
}

else if(ai_state == monster_states.seek) {
	#region // Seek State Logic
	//Incremement counter and check if monster gives up searching
	counter += 1;
	if(counter >= room_speed * seek_time) {
		ai_state = monster_states.wander;
	}
	
	//Check if player spotted
	if(collision_line(x-(dir_facing*20),y,x+(dir_facing*sight_range),y,obj_player,false,true)) {
		ai_state = monster_states.chase;
	}
	
	//Run to the last location of the player, then wander???
	x += dir_facing * chase_speed;
	#endregion
}

else if(ai_state == monster_states.chase) {
	#region // Chase State Logic
	
	//DEBUG!!
	image_blend = c_red;
	
	var player_x = obj_player.x;
	
	dir_facing = sign(player_x-x); //ERROR!! Can equal 0 and make them dissapear
	if(dir_facing = 0) { dir_facing = choose(1,-1); }
	
	//If player escapes sight, monster starts seeking at last place they saw
	if(!collision_line(x-(dir_facing*20),y,x+(dir_facing*sight_range),y,obj_player,false,true)) {
		ai_state = monster_states.seek;
	}
	
	//Chase the player
	x += dir_facing * chase_speed;
	#endregion
}

//Set sprite to reflect current state and direction
sprite_index = sprite_array[ai_state];
image_xscale = sign(dir_facing);