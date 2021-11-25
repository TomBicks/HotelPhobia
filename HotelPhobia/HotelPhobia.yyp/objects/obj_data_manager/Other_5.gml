/// @description Save Environmental Object Data on leaving room

	//NOTE!! Add each of the identifier to a list, pass this list as a lcoal variable to this data manager, then go through the list and add them to the map, with their states as well???
	//Would passing a lsit work or would it duplicate?
	//Is it better to leave it as I do with the item pickups>
	//Is it better to change the item pickups to work like this if this is successful?
	//Which is better???

#region //Update or add state of environmental object
	//Save states of all lights in the room
	//with(obj_light_parent) { scr_save_env_obj_data(light_on); }
	
	//Save states of all light switches in the room
	//with(obj_light_switch) { scr_save_env_obj_data(switch_on); }
#endregion