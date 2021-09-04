/// @function		scr_monster_attack_basic();
/// @description	Cause the monster to initiate an attack against the player

//UNIMPLEMENTED!!

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