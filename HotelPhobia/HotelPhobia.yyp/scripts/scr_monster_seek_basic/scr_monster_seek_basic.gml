/// @function		scr_monster_seek_basic();
/// @description	Cause the monster to wander hurriedly whilst looking for the player
function scr_monster_seek_basic() {

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

}