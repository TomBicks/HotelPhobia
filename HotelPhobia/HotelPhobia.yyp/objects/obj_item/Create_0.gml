//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
item_id = inv_items.can; //The ID of the item being picked up
item_amount = 1; //The quantity of the item being picked up

//Define unique string for the item
identifier = object_get_name(object_index) + room_get_name(room) + string(x) + string(y);

#region //Add item to Data Manager's map, check if item exists or destroy it if not
if(instance_exists(obj_data_manager)) {
	with(obj_data_manager) {
		//Get identifier for item
		var _identifier = other.identifier;
	
		//Check if item has already been encountered and added to the map
		var _result = ds_map_find_value(env_item_data, _identifier);
	
		//If item is already picked up, destroy it, as it has already been picked up
		if(!is_undefined(_result)) {
			if(_result == "picked_up") { 
				instance_destroy(other); 
				show_debug_message("Item " + _identifier + " already picked up; destroying item");
			}
			else {
				show_debug_message("Item " + _identifier + " still on ground; leaving as is");
			}
		}
		//If item is not in the map, add it as being still on the ground
		else {
			ds_map_add(env_item_data, _identifier, "on_ground");
			show_debug_message("Item " + _identifier + " encountered for first time; adding to map");
		}
	}
}
else { 
	show_error("Item could not find Data Manager!", false); 
}
#endregion

#region //Define script to run when object is interacted with
behaviour = function scr_item_pickup() {
//If item can reach data manager, indicate this item has been picked up
if(instance_exists(obj_data_manager)) {
	#region //Update state to reflect item has been picked up and so won't appear again
	show_debug_message("Picking up item " + identifier);
	ds_map_replace(obj_data_manager.env_item_data, identifier, "picked_up");
	#endregion
	
	#region //Add item to inventory
	//Set instance variables to local variables, so inventory manager can access them
	var _item_id = self.item_id;
	var _item_amount = self.item_amount;

	//Play item pickup sound
	audio_play_sound(snd_pickup_item, 0, false);

	//Add item to inventory
	with (obj_inv_manager) { scr_inv_add_item(_item_id, _item_amount); }
	#endregion
}
//Else, something is wrong, as the item should always be able to reach the data manager; throw an error
else {
	show_error("Item could not find Data Manager!", false); 
}

//Destroy item object after pickup
instance_destroy(self, false);

}
#endregion