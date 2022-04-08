/// @description Insert description here

#region //Check for interactable objects nearby
if(instance_exists(obj_interact_parent)) {
	var _nearby_interact = instance_nearest(x, y, obj_interact_parent);
	if(distance_to_object(_nearby_interact) < interact_range) {
		with (obj_interact_parent) {
			if(self.id == _nearby_interact) {
				nearby = true;
				if(keyboard_check_pressed(vk_up)) {
					script_execute(behaviour);	
				}
			} else {
				nearby = false;
			}
		}
	} else {
		_nearby_interact.nearby = false;
	}
}
#endregion

#region //Movement Left & Right (Walking & Sprinting)
//Transitions for the Player State Machine are:
	//Idle to walking when moving left or right from idle
	//Idle to running when holding sprint key and moving left or right from idle

	//Walking to idle when stop moving left or right
	//Walking to running when holding down sprint key

	//Running to idle when stop moving but not letting go of sprint key
	//Running to walking when stop holding down sprint key but not stop moving left or right

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
sprint = keyboard_check(vk_shift);

h_move = (right - left);

if(h_move == 0) { 
	//Set player to idle if not moving
	player_state = player_states.idle; 
}
else { 
	if(sprint) { 
		//Set player to running if moving and holding down sprint key
		player_state = player_states.sprint; 
		h_move = h_move * sprint_speed;
	}
	else {
		//Set player to walking if moving and not holding down sprint key
		player_state = player_states.walk; 
		h_move = h_move * walk_speed;
	}
}

x+=h_move;
#endregion

//Set sprite to reflect current state and direction
sprite_index = sprite_array[player_state];
//image_xscale = sign(dir_facing);