/// @description Insert description here
// You can write your code in this editor

#region //Update or add state of environmental objects (E.g. lights and switches, on or off)
	#region //Obtain states of all lights in the room
	with(obj_light_parent) {
		//Define unique string for the light object
		var _identifier = object_get_name(object_index) + room_get_name(room) + string(x) + string(y);
	}
	//NOTE!! Add each of the identifier to a list, pass this list as a lcoal variable to this data manager, then go through the list and add them to the map, with their states as well???
	//Would passing a lsit work or would it duplicate?
	//Is it better to leave it as I do with the item pickups>
	//Is it better to change the item pickups to work like this if this is successful?
	//Which is better???
	#endregion
#endregion