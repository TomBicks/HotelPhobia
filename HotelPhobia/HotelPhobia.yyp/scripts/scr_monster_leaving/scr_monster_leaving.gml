/// @function		scr_monster_leaving();
/// @description	Cause the monster to leave the current room for its origin room
function scr_monster_leaving() {

	//UNIMPLEMENTED!!

	//DEBUG CODE!!
	image_blend = c_gray;

	//Move towards the exit door, then either teleport back to origin room or delete and new instance in origin room
	//Turn off Leaving Alarm
	if(is_leaving) { alarm_set(1, -1); }
	//NOTE!! This is mainly handled by the monster controller, most likely


}
