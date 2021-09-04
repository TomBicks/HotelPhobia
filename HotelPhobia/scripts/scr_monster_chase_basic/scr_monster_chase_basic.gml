/// @function		scr_monster_chase_basic();
/// @description	Cause the monster to chase after the player

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