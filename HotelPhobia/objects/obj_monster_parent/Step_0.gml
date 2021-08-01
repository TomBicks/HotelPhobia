/// @description AI States Logic
//Tutorial found https://www.youtube.com/watch?v=DYkJ91eg67Y

//DEBUG CODE!!
image_blend = c_white;

if(ai_state == monster_states.idle) {
	#region // Idle State Logic
	counter += 1;
	if(seek_counter > 0) { seek_counter -= 1; }
	//If monster is seeking player, simply pause before seeking again and break
	if(seek_x != 0)
	//Check if monster should select a new action
	if(counter >= room_speed * wander_time) {
		var change = choose(0,1);
		switch(change) {
			case 0: 
				ai_state = monster_states.wander;
			case 1: 
				counter = 0;
				dir_facing = choose(-1,1);
				wander_time = irandom_range(wander_time_min,wander_time_max);
				break;
		}
	}
	
	//Check if player spotted
	if(collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*sight_max),y,obj_player,false,true)) {
		counter = 0;
		seek_counter = 0;
		ai_state = monster_states.chase;
	}
	#endregion
}

else if(ai_state == monster_states.wander) {
	#region // Wander State Logic
	counter += 1;
	if(seek_counter > 0) { seek_counter -= 1; }
	//Check if monster should select a new action
	if(counter >= room_speed * wander_time) {
		var change = choose(0,1);
		switch(change) {
			case 0: 
				ai_state = monster_states.idle;
			case 1: 
				counter = 0;
				dir_facing = choose(-1,1);
				wander_time = irandom_range(wander_time_min,wander_time_max);
				break;
		}
	}
	
	//Check if player spotted
	if(collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*sight_max),y,obj_player,false,true)) {
		counter = 0;
		seek_counter = 0;
		ai_state = monster_states.chase;
	}
	
	//Wander in the direction chosen (if seeking, move faster)
	if(seek_counter <= 0) { x += dir_facing * wander_speed; }
	else { x += dir_facing * seek_speed; }
	#endregion
}

else if(ai_state == monster_states.seek) {
	#region // Seek State Logic
	
	//DEBUG CODE!!
	image_blend = c_orange;
	
	/*NOTE!! What I think I want to do is make seek move the player like wander, going to idle when stopping and
	idle going to seek when moving (checking if the seek timer is still above 0). I also want it to go to idle when 
	stopped seeking, as the change in speed when goign from seek to wander is strange.*/
	
	/*WAIT!! I should probably just set this to move towards the last place the player was, 
	then make this work just like wander but at running speed*/
	
	//Set monster to idle when it reaches the seek location
	if(x == seek_x) {
		ai_state = monster_states.idle;
	}
	
	//Check if player spotted
	if(collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*sight_max),y,obj_player,false,true)) {
		seek_counter = 0;
		ai_state = monster_states.chase;
	}
	
	//Move towards the seek location
	x += sign(seek_x-x) * seek_speed;
	#endregion
}

else if(ai_state == monster_states.chase) {
	#region // Chase State Logic
	
	//DEBUG CODE!!
	image_blend = c_red;
	
	//NOTE!! Need to make the monster stop short of the player and make an attack, rather then step on top of them
	dir_facing = sign(obj_player.x-x); //ERROR!! Can equal 0 and make them dissapear
	if(dir_facing = 0) { dir_facing = choose(1,-1); } //ERROR!! Doesn't work becuase the movement goes past the point
	
	//If player escapes sight, monster starts seeking at last place they saw
	if(!collision_line(x+(dir_facing*sight_min),y,x+(dir_facing*sight_max),y,obj_player,false,true)) {
		seek_x = obj_player.x;
		seek_counter = room_speed * seek_search_time;
		ai_state = monster_states.seek;
	}
	
	//Chase the player
	x += dir_facing * seek_speed;
	#endregion
}

//Set sprite to reflect current state and direction
sprite_index = sprite_array[ai_state];
image_xscale = sign(dir_facing);